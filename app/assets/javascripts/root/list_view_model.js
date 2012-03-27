Root.ListViewModel = function() {
  var self = this;
  
  self.Task = function(data, opts) {
    var self = this;
    var data = data || {};
    var opts = opts || {};
    
    self.id   = data.id;
    self.name = ko.observable(data.name).extend({
                  required: true,
                  unique: opts.scope,
                  logged: "name"
                });
    
    self.done = ko.observable(data.done);
    self.open = ko.computed(function() { return !self.done(); });
  };
  
  self.tasks = ko.observableArray([]);
  
  api.v1.tasks.index(function(json) {
    self.tasks(_.map(json.data, function(task) { 
      return new self.Task(task, {scope: self.tasks}) 
    }));
  });
  
  self.completedTasks = ko.computed(function() {
    return _.filter(self.tasks(), function(task) {
      return task.done();
    });
  });
  
  self.incompleteTasks = ko.computed(function() {
    return _.filter(self.tasks(), function(task) {
      return !task.done();
    });
  });
  
  self.newTask = {
    name: ko.observable()
  };
  
  self.createTask = function() {
    api.v1.tasks.create({ task: ko.toJS(self.newTask) },
    function(task) {
      self.tasks.unshift(new self.Task(task, {scope: self.tasks}));
      self.newTask.name("");
    },
    function(error) {
      Root.modalViewModel.render("Error", error);
    });
  };
  
  self.toggleTask = function(task) {
    api.v1.tasks.toggle(task.id);
    task.done(!task.done());
  };
  
  self.updateTask = function(task) {
    if (task.name.isValid()) {
      api.v1.tasks.update(task.id, { task: ko.toJS(task) })
    }
  };
  
  self.destroyTask = function(task) {
    api.v1.tasks.destroy(task.id, function() {
      self.tasks.remove(task);
    });
  };
};

Root.ListViewModel.prototype = new Root.NamespaceViewModel();
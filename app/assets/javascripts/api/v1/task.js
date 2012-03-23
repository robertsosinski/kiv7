Api.V1.Task = function(data, opts) {
  var self = this;
  var data = data || {};
  var opts = opts || {};
    
  self.id   = data.id;
  self.name = ko.observable(data.name).extend({
    presence: "Task name is required", 
    unique: {
      scope: opts.scope,
      errorMessage: "Task name must be unique"
    }
  });
  self.done = ko.observable(data.done);
  self.open = ko.computed(function() { return !self.done(); });
  
  self.name.hasError = ko.computed(function() {
    return self.name.notPresent() || self.name.notUnique();
  });
};

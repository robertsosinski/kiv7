Api.V1.Task = function(data, opts) {
  data = data || {};
  opts = opts || {};
  
  var self = this;
  
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
};
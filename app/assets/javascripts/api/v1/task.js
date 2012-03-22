Api.V1.Task = function(data) {
  data = data || {};
  
  var self = this;
  
  self.id   = data.id;
  self.name = ko.observable(data.name).extend({presence: "Task name is required"});
  self.done = ko.observable(data.done);
  self.open = ko.computed(function() { return !self.done(); });
};
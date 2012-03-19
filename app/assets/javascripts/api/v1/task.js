Api.V1.Task = function(data) {
  var self = this;
  
  self.id   = data.id;
  self.name = ko.observable(data.name);
  self.done = ko.observable(data.done);
  self.open = ko.computed(function() { return !self.done(); });
};
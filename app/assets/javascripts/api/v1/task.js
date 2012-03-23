Api.V1.Task = function(data, opts) {
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

Api.V1.Task.prototype = new Api.V1.Base();
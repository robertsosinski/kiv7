Root.ModalsViewModel = function() {
  var self = this;

  self.error = {
    body: ko.observable(),
    
    render: function(messages) {
      // format errors as a list, eg::
      //  from: {"errors":{"name":["Name cant be blank", "Name must be unique"]}}
      //    to: ["Name cant be blank", "Name must be unique"]
      var errors = _.reduce(messages, function(memo, attr) {
        return _.map(_.keys(attr), function(field) {
          return attr[field];
        });
      }, []);
      
      errors = _.flatten(errors);

      self.error.body(errors);
      self.show('error');
    }
  }
  
  self.show = function(type) {
    $("#modal-" + type).modal({
      keyboard: true
    });
  };
};

Root.ModalsViewModel.prototype = new Root.NamespaceViewModel();
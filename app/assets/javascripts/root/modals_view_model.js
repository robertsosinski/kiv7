Root.ModalsViewModel = function() {
  var self = this;

  self.error = {
    errors: ko.observable(),

    render: function(messages) {
      // format errors as a list, eg:
      //  from: {"errors":{"name":["Name cant be blank", "Name must be unique"]}}
      //    to: ["Name cant be blank", "Name must be unique"]
      var errors = _.reduce(messages, function(memo, attr) {
        return _.map(_.keys(attr), function(field) {
          return attr[field];
        });
      }, []);
      
      errors = _.flatten(errors);

      this.errors(errors);
      self.show('error');
    },

    log: function(data, event) {
      console.log(data);
      console.log(event);
      console.log(event.target);
    }
  };

  self.show = function(type) {
    self.hide();

    $('#modals-view #modal-' + type).modal({
      keyboard: true
    });
  };

  self.hide = function() {
    $('#modals-view .modal').modal('hide');
  };
};

Root.ModalsViewModel.prototype = new Root.NamespaceViewModel();

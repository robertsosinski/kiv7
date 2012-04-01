Root.ModalsViewModel = function() {
  var self = this;

  self.header = ko.observable();
  self.list   = ko.observable();
  
  self.render = function(header, body) {
    // format errors as a list, eg::
    //  from: {"errors":{"name":["Name cant be blank", "Name must be unique"]}}
    //    to: ["Name cant be blank", "Name must be unique"]
    var errors = _.reduce(body, function(memo, attr) {
      return _.map(_.keys(attr), function(field) {
        return attr[field];
      });
    }, []);
    
    self.header(header);
    self.list(errors);
    self.show();
  };
  
  self.show = function() {
    $("#modal-view").modal({
      keyboard: true
    });
  };
};

Root.ModalsViewModel.prototype = new Root.NamespaceViewModel();
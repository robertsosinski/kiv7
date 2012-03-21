Root.NamespaceViewModel = function() {
  var self = this;
  
  self.modal = {
    header: ko.observable(),
    body: ko.observable()
  };
  
  self.setModal = function(options) {
    var errors = _.reduce(options.body, function(memo, attr) {
        return _.map(_.keys(attr), function(field) {
            return field + " " + attr[field];
        });
    }, []);
    
    self.modal.header(options.header);
    self.modal.body(errors);
    
    $("#modal-alert").modal({
      keyboard: true
    });
  };
}

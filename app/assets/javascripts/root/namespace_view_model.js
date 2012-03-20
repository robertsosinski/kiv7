Root.NamespaceViewModel = function() {
  var self = this;
  
  self.modal = {
    header: ko.observable(),
    body: ko.observable()
  };
  
  self.setModal = function(options) {
    self.modal.header(options.header);
    self.modal.body(options.body);
    
    $("#modal-error").modal({
      keyboard: true
    });
  };
}

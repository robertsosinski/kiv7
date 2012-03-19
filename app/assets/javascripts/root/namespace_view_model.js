Root.NamespaceViewModel = function() {
  var self = this;
  
  self.modal = {
    header: ko.observable(),
    body: ko.observable()
  };
  
  self.setModal = function(header, body) {
    self.header(header);
    self.body(body);
  };
  
  self.resetModal = function() {
    self.header("");
    self.body("");
  };
}
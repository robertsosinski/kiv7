//= require_tree ./ko
//= require_self

ko.element = function(id) {
  var element = document.getElementById(id);
  
  if (element) {
    return document.getElementById(id);
  }
  else {
    throw('Element with id "' + id + '" could not be found');
  }
};

ko.validation.init({insertMessages: false});

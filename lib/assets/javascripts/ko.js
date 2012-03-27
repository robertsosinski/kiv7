//= require_tree ./ko
//= require_self

ko.element = function(id) {
  return document.getElementById(id);
};

ko.validation.init({insertMessages: false});

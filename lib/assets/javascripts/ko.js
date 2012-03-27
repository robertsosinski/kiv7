//= require_tree ./ko
//= require_self

ko.validation.init({insertMessages: false});

ko.element = function(id) {
  return document.getElementById(id);
};
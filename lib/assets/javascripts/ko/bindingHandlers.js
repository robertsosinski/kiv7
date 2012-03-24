ko.bindingHandlers.star = {
  update: function(element, valueAccessor) {
    var value   = ko.utils.unwrapObservable(valueAccessor()),
        element = $(element);
    
    if (value == true) {
      element.addClass("icon-star");
      element.removeClass("icon-star-empty");
    }
    else {
      element.removeClass("icon-star");
      element.addClass("icon-star-empty");
    }
  }
};

ko.bindingHandlers.valid = {
  update: function(element, valueAccessor) {
    var value  = ko.utils.unwrapObservable(valueAccessor()),
        element = $(element);
    
    if (value == true) {
      element.removeClass("error");
    }
    else {
      element.addClass("error");
    }
  }
};
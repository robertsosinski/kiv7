ko.bindingHandlers.star = {
  update: function(element, valueAccessor) {
    var value = ko.utils.unwrapObservable(valueAccessor());
    
    if (value == true) {
      $(element).addClass("icon-star");
      $(element).removeClass("icon-star-empty");
    }
    else {
      $(element).removeClass("icon-star");
      $(element).addClass("icon-star-empty");
    }
  }
};
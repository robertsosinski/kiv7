ko.bindingHandlers.yourBindingName = {
  init: function(element, valueAccessor, allBindingsAccessor, viewModel) {
    // This will be called when the binding is first applied to an element
    // Set up any initial state, event handlers, etc. here
  },
  update: function(element, valueAccessor, allBindingsAccessor, viewModel) {
    // This will be called once when the binding is first applied to an element,
    // and again whenever the associated observable changes value.
    // Update the DOM element based on the supplied values here.
  }
};

ko.bindingHandlers.star = {
  update: function(element, valueAccessor) {
    if (ko.utils.unwrapObservable(valueAccessor())) {
      $(element).addClass("icon-star");
      $(element).removeClass("icon-star-empty");
    }
    else {
      $(element).removeClass("icon-star");
      $(element).addClass("icon-star-empty");
    }
  }
};
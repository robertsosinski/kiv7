ko.extenders.presence = function(target, errorMessage) {
  errorMessage = errorMessage || "can't be blank";
  
  //add some sub-observables to our observable
  target.hasError = ko.observable();
  target.errorMessage = ko.observable();

  //define a function to do validation
  function validate(newValue) {
    target.hasError(newValue ? false : true);
    target.errorMessage(newValue ? "" : errorMessage);
  }

  //initial validation
  validate(target());

  //validate whenever the value changes
  target.subscribe(validate);

  //return the original observable
  return target;
};
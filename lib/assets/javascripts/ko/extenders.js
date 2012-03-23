ko.extenders.presence = function(target, errorMessage) {
  var errorMessage = errorMessage || "can't be blank";
  
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

ko.extenders.unique = function(target, opts) {
  var errorMessage = opts.errorMessage || "must be unique";
  
  //add some sub-observables to our observable
  target.hasError = ko.observable();
  target.errorMessage = ko.observable();
  
  //define a function to do validation
  function validate(newValue) {
    var taskNames = _.map(opts.scope(), function(task) { return task.name() }),
        notUnique = _.select(taskNames, function(name) { return name == newValue}).length > 1;
    
    if (notUnique) {
      target("");
      target.hasError(true);
      target.errorMessage(opts.errorMessage);
    }
    else {
      target.hasError(false);
      target.errorMessage("");
    }
  }

  //validate whenever the value changes
  target.subscribe(validate);

  //return the original observable
  return target;
}
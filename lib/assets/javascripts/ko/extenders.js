ko.extenders.logged = function(target, option) {
  target.subscribe(function(newValue) {
   console.log(option + " changed to " + newValue);
  });
  
  return target;
};
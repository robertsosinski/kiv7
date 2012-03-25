Admin.StatsViewModel = function() {
  var self = this;
  
  self.stats = ko.observableArray([
    {day: "Sunday", up: true},
    {day: "Monday", up: true},
    {day: "Tuesday", up: false},
    {day: "Wednesday", up: true},
    {day: "Thursday", up: false},
    {day: "Friday", up: true},
    {day: "Saturday", up: true},
  ]);
};

Admin.StatsViewModel.prototype = new Admin.NamespaceViewModel();
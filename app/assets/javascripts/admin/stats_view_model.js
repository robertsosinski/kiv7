Admin.StatsViewModel = function() {
  var self = this;
  
  self.stats = ko.observableArray([
    {day: "Sunday",    up: ko.observable(true)},
    {day: "Monday",    up: ko.observable(true)},
    {day: "Tuesday",   up: ko.observable(false)},
    {day: "Wednesday", up: ko.observable(true)},
    {day: "Thursday",  up: ko.observable(false)},
    {day: "Friday",    up: ko.observable(true)},
    {day: "Saturday",  up: ko.observable(true)},
  ]);
};

Admin.StatsViewModel.prototype = new Admin.NamespaceViewModel();
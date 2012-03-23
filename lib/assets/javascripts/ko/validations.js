ko.validation.rules['unique'] = {
  validator: function (val, scope) {
    var taskNames = _.map(scope(), function(task) { return task.name() }),
        isUnique  = _.select(taskNames, function(name) { return name == val; }).length <= 1;
    
    return val && isUnique;
  },
  message: 'This must be unique.'
};
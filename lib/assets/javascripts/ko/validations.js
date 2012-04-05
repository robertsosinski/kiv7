//Validation Rules:
// You can view and override messages or rules via:
// ko.validation.rules[ruleName] 
// 
// To implement a custom Rule, simply use this template:
// ko.validation.rules['<custom rule name>'] = {
//      validator: function (val, param) {
//          <custom logic>
//          return <true or false>;
//      },
//      message: '<custom validation message>' //optionally you can also use a '{0}' to denote a placeholder that will be replaced with your 'param'
// };
//
// Example:
// ko.validation.rules['mustEqual'] = {
//      validator: function( val, mustEqualVal ){
//          return val === mustEqualVal;
//      }, 
//      message: 'This field must equal {0}'
// };
//
ko.validation.rules = {};
ko.validation.rules['required'] = {
    validator: function (val, required) {
        return required && val && (val + '').length > 0;
    },
    message: 'This field is required.'
};

ko.validation.rules['min'] = {
    validator: function (val, min) {
        return !val || val >= min;
    },
    message: 'Please enter a value greater than or equal to {0}.'
};

ko.validation.rules['max'] = {
    validator: function (val, max) {
        return !val || val <= max;
    },
    message: 'Please enter a value less than or equal to {0}.'
};

ko.validation.rules['minLength'] = {
    validator: function (val, minLength) {
        return val && val.length >= minLength;
    },
    message: 'Please enter at least {0} characters.'
};

ko.validation.rules['maxLength'] = {
    validator: function (val, maxLength) {
        return !val || val.length <= maxLength;
    },
    message: 'Please enter no more than {0} characters.'
};

ko.validation.rules['pattern'] = {
    validator: function (val, regex) {
        return !val || val.match(regex) != null;
    },
    message: 'Please check this value.'
};

ko.validation.rules['step'] = {
    validator: function (val, step) {
        return val % step === 0;
    },
    message: 'The value must increment by {0}'
};

ko.validation.rules['email'] = {
    validator: function (val, validate) {
        return validate && /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(val);
    },
    message: '{0} is not a proper email address'
};

ko.validation.rules['date'] = {
    validator: function (value, validate) {
        return validate && !/Invalid|NaN/.test(new Date(value));
    },
    message: 'Please enter a proper date' 
};

ko.validation.rules['dateISO'] = {
    validator: function (value, validate) {
        return validate && /^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(value);
    },
    message: 'Please enter a proper date'
};

ko.validation.rules['number'] = {
    validator: function (value, validate) {
        return validate && /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
    },
    message: 'Please enter a number'
};

ko.validation.rules['digits'] = {
    validator: function (value, validate) {
        return validate && /^\d+$/.test(value);
    },
    message: 'Please enter a digit'
};

ko.validation.rules['phoneUS'] = {
    validator: function (phoneNumber, validate) {
        if (typeof (phoneNumber) !== 'string') { return false; }
        phoneNumber = phoneNumber.replace(/\s+/g, "");
        return validate && phoneNumber.length > 9 && phoneNumber.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
    },
    message: 'Please specify a valid phone number'
};

ko.validation.rules['unique'] = {
    validator: function (val, scope) {
        var taskNames = _.map(scope(), function(task) { return task.name() }),
            isUnique  = _.select(taskNames, function(name) { return name == val; }).length <= 1;
        
        return val && isUnique;
    },
    message: 'This must be unique.'
};

//= require_self
//= require api/v1
//= require_tree ./api/v1

window.api = {
  ajax: function(path, settings) {
    // set the defaults for each ajax request
    var defaults = {
      url: "/api" + path,
      dataType: "json",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      }
    };
    
    // merge defaults with the provided settings
    settings = $.extend(true, defaults, settings);
    
    // always ensure the type is uppercase
    settings.type = settings.type.toUpperCase();
    
    // encode data as a url-query or json
    if (settings.data) {
      if (settings.type == "GET") {
        settings.data = $.param(settings.data);
      }
      else {
        settings.data = JSON.stringify(settings.data);
      }
    }
    
    // overide http methods that are not a get or post
    if (!(/^(get|post)$/i).test(settings.type)) {
      settings.headers["X-Http-Method-Override"] = settings.type;
      settings.type = "POST";
    }
    
    return $.ajax(settings);
  },
  
  request: function(type, args) {
    var settings = { type: type };
    
    // data argument was not given
    if (typeof(args[1]) == "function") {
      settings.data    = undefined;
      settings.success = args[1];
      settings.error   = args[2];
    }
    // data argument was given
    else {
      settings.data    = args[1];
      settings.success = args[2];
      settings.error   = args[3];
    }
    
    // normalize error callback to act more like success callback
    if (settings.error) {
      var _error = settings.error;
      
      settings.error = function(xhr, status, error) {
        try {
          return _error(JSON.parse(xhr.responseText), status, xhr);
        }
        catch (e) {
          return _error(xhr.responseText, status, xhr);
        }
      }
    }
    
    // make the ajax request
    return this.ajax(args[0], settings);
  },
  
  get: function() {
    return this.request("GET", arguments);
  },
  
  post: function() {
    return this.request("POST", arguments);
  },
  
  put: function() {
    return this.request("PUT", arguments);
  },
  
  patch: function() {
    return this.request("PATCH", arguments);
  },
  
  delete_: function() {
    return this.request("DELETE", arguments);
  },
};
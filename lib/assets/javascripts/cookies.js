window.cookies = {
  set: function(name, value, days) {
    var expires;
    if (name) {
      if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
      }
      else {
        expires = "";
      }
      document.cookie = name + "=" + escape(value) + expires + "; path=/";
    }
  },
  
  // requires JSON library
  setJSON: function(name, value, days) {
    this.set(name, JSON.stringify(value), days);
  },
  
  get: function(name) {
    if (name) {
      var match = document.cookie.match(new RegExp(name + "=(.*?)(?:;|$)"));
      if (match) {
        return unescape(match[1].replace(/\+/g, "%20"));
      }
    }
  },
  
  // requires JSON library
  getJSON: function(name) {
    var value = this.get(name);
    if (value) {
      return JSON.parse(value);
    }
  },
  
  list: function() {
    var pairs = document.cookie.split(new RegExp("; "));
    if (pairs.length > 0 && pairs[0] !== "") {
      var keys = [];
      
      for (var i = 0; i < pairs.length; i++) {
        keys[i] = pairs[i].match(/(.+?)=/)[1];
      }
      return keys;
    }
    return [];
  },
  
  // delete is a reserved word, so appending an underscore
  delete_: function(name) {
    this.set(name, "" , -1);
  }
};
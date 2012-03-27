api.v1.tasks = {
  index: function(data, success, error) {
    return api.get("/v1/tasks", data, success, error);
  },
  
  create: function(data, success, error) {
    return api.post("/v1/tasks", data, success, error);
  },
  
  update: function(id, data, success, error) {
    return api.put("/v1/tasks/" + id, data, success, error);
  },
  
  toggle: function(id, data, success, error) {
    return api.put("/v1/tasks/" + id + "/toggle", data, success, error);
  },
    
  destroy: function(id, data, success, error) {
    return api.delete_("/v1/tasks/" + id, data, success, error);
  }
};
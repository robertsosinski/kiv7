Rails.configuration.middleware.use Warden::Manager do |manager|
  manager.default_strategies :username_password
  manager.failure_app = Root::SessionsController.action(:failure)
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find_by_id(id)
end

Warden::Strategies.add(:username_password) do
  def valid?
    params["session"] && params["session"]["username"] && params["session"]["password"]
  end

  def authenticate!
    user = User.authenticate(params["session"]["username"], params["session"]["password"])
    user ? success!(user) : fail!("Invalid username and/or password.")
  end
end
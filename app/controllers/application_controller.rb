class ApplicationController < ActionController::Base
  def warden
    env['warden']
  end
  helper_method :warden
end

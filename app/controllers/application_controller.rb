class ApplicationController < ActionController::Base
  def warden
    request.env['warden']
  end
  helper_method :warden
end

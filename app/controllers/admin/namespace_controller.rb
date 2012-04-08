class Admin::NamespaceController < ApplicationController
  protect_from_forgery
  layout 'admin/layouts/namespace'
  
  before_filter :check_authentication
  
  protected
  
  # used to set the locale namespace.
  def default_url_options(options={})
    { :locale => session[:locale] }
  end
  
  def check_authentication
    if warden.user && warden.user.admin?
    else
      flash[:notice] = "Nothing to see here, move along!"
      
      if warden.authenticated?
        redirect_to lists_path
      else
        redirect_to new_sessions_path
      end
    end
  end
end
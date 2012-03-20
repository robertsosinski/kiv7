class Admin::NamespaceController < ApplicationController
  protect_from_forgery
  layout 'admin/layouts/namespace'
  
  before_filter :check_authentication
  
  protected
  
  def check_authentication
    if !warden.authenticated? || !warden.user.admin?
      flash[:notice] = "Nothing to see here, move along!"
      
      if warden.authenticated?
        redirect_to lists_path
      else
        redirect_to new_sessions_path
      end
    end
  end
end
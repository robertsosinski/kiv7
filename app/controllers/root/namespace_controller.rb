class Root::NamespaceController < ApplicationController
  protect_from_forgery
  layout 'root/layouts/namespace'
  
  protected
  
  def check_authentication
    unless warden.authenticated?
      flash[:notice] = "You have to login before you can access your task list."
      redirect_to new_sessions_path
    end
  end
end
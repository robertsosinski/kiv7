class Root::NamespaceController < ApplicationController
  protect_from_forgery
  layout 'root/layouts/namespace'
  
  before_filter :set_locale
  
  protected
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  # Used to set the locale namespace.
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
  def check_authentication
    unless warden.authenticated?
      flash[:notice] = "You have to login before you can access your task list."
      redirect_to new_sessions_path
    end
  end
end
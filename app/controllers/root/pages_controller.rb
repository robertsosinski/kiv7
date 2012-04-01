class Root::PagesController < Root::NamespaceController
  skip_before_filter :set_locale, :only => :home
  
  def home
    redirect_to "/#{session[:locale] || :en}", :status => 301
  end
  
  def welcome
    redirect_to lists_path if warden.authenticated?
  end
end

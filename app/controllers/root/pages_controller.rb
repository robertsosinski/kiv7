class Root::PagesController < Root::NamespaceController
  skip_before_filter :set_locale, :only => :home
  
  def home
    # This action is only used to redirect the user to the proper localized welcome page
    redirect_to pages_path(:action => 'welcome', :locale => (session[:locale] || :en), :status => 301)
  end
  
  def welcome
    redirect_to lists_path if warden.authenticated?
  end
end

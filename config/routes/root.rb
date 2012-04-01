Kiv7::Application.routes.draw do
  scope :module => :root do
    root :to => 'pages#home'
    
    scope ':locale', :locale => /en|fr|jp/ do
      root :to => 'pages#welcome'
      
      match 'pages/:action', :controller => 'pages', :as => :pages
    
      resource :sessions
      resource :users
      resource :lists
    end
  end
end
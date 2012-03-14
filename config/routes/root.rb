Kiv7::Application.routes.draw do
  scope :module => :root do
    root :to => 'pages#welcome'
    
    # routes all pages to an appropriate template
    match 'pages/:action', :controller => 'pages'
    
    resource :sessions
    resource :users
    resource :lists
  end
end
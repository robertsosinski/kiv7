class Root::SessionsController < Root::NamespaceController
  def show
    render :json =>  session
  end
  
  def new
  end
  
  def create
    warden.authenticate!
    flash[:success] = "Welcome back #{warden.user.username}."
    
    redirect_to lists_path
  end
  
  def destroy
    warden.logout
    flash[:notice] = "Thanks for dropping by."
    
    redirect_to root_path
  end
  
  def failure
    flash.now[:error] = warden.message
      
    render :new
  end
end

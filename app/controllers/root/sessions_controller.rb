class Root::SessionsController < Root::NamespaceController
  def show
    render :text =>  session.inspect
  end
  
  def new
  end
  
  def create
    warden.authenticate!
    
    render :text =>  session.inspect
  end
  
  def destroy
    warden.logout
    
    render :text =>  session.inspect
  end
  
  def failure
    flash.now[:error] = warden.message
      
    render :new
  end
end

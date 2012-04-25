class Root::UsersController < Root::NamespaceController
  def new
    redirect_to lists_path if warden.authenticated?
    
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      warden.set_user(@user)
      flash[:success] = t('root.layouts.flash.success.welcome', :username => warden.user.username)
      
      redirect_to lists_path
    else
      render :new
    end
  rescue
    flash.now[:error] = t('root.layouts.flash.error.something_else')
    render :new
  end
end

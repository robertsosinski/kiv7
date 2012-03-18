class Root::UsersController < Root::NamespaceController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      warden.set_user(@user)
      flash[:success] = "Hey #{@user.username}, welcome to Kiv7!"
      
      redirect_to lists_path
    else
      render :new
    end
  end
end

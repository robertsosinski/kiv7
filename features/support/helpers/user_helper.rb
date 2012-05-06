module UserHelper
  def user
    @user ||= create(:user)
  end
end

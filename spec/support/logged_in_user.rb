shared_examples_for 'logged in user' do
  let(:current_user) { Factory(:user) }

  before do
    visit new_sessions_path(:locale => 'en')

    fill_in "Username", :with => current_user.username
    fill_in "Password", :with => 'hushhush'

    within '.form-actions' do
      click_on "Login"
    end
  end
end
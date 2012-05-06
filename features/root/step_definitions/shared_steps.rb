World UserHelper

Given /^that the user is logged in$/ do
  visit '/en/sessions/new'

  fill_in "Username", :with => user.username
  fill_in "Password", :with => 'hushhush'

  within '.form-actions' do
    click_on "Login"
  end
end


World UserHelper

When /^that there is already a user in the system$/ do
  user.should be_valid
end

Given /^the user is at at the signup page$/ do
  visit '/en/users/new'
  current_path.should eql new_users_path(:locale => 'en')
end

When /^entering a unique username$/ do
  fill_in "Username", :with => generate(:username)
end

When /^entering a secure password$/ do
  fill_in "Password", :with => 'hushhush'
end

When /^entering a username that is already taken$/ do
  fill_in "Username", :with => user.username
end

When /^entering a password that is too short$/ do
  fill_in "Password", :with => 'pass'
end

When /^signing up with their credentials$/ do
  within '.form-actions' do
    click_on "Signup"
  end
end

Then /^the user should stay on the signup page$/ do
  current_path.should eql users_path(:locale => 'en')
end

Then /^a welcome message should be displayed$/ do
  find '.alert-success', :text => /welcome/
end

Then /^an invalid username message should be displayed$/ do
  find '.help-inline', :text => "Username must be unique"
end

Then /^an invalid password message should be displayed$/ do
  find '.help-inline', :text => "Password must be atleast 6 letters, numbers and special characters"
end

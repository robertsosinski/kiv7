World UserHelper

Given /^a valid user account$/ do
  user.should be_valid
end

Given /^the user is at at the login page$/ do
  visit '/en/sessions/new'
  current_path.should eql new_sessions_path(:locale => 'en')
end

When /^entering a valid username$/ do
  fill_in "Username", :with => user.username
end

When /^entering a valid password$/ do
  fill_in "Password", :with => 'hushhush'
end

When /^entering an invalid username$/ do
  fill_in "Username", :with => 'mallory'
end

When /^entering an invalid password$/ do
  fill_in "Password", :with => 'nopenope'
end

When /^submiting their credentials$/ do
  within '.form-actions' do
    click_on "Login"
  end
end

Then /^the user should be sent to the list page$/ do
  current_path.should eql lists_path(:locale => 'en')
end

Then /^the user should stay on the login page$/ do
  current_path.should eql sessions_path(:locale => 'en')
end

Then /^a welcome back message should be displayed$/ do
  find '.alert-success', :text => /welcome back/i
end

Then /^an invalid credentials message should be displayed$/ do
  find '.alert-error', :text => "Invalid username or password."
end


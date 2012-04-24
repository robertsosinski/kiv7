require 'spec_helper'

describe 'when a user goes to the login page' do
  let(:user) { Factory(:user) }

  before do
    visit new_sessions_path(:locale => 'en')
  end

  describe 'and tries to login in' do
    describe 'with correct credentials' do
      before do
        fill_in "Username", :with => user.username
        fill_in "Password", :with => 'hushhush'

        within '.form-actions' do
          click_on "Login"
        end
      end

      specify 'he should go to the list page' do
        current_path.should eql lists_path(:locale => 'en')
      end
    end

    describe 'with an incorrect username' do
      before do
        fill_in "Username", :with => 'mallory'
        fill_in "Password", :with => 'hushhush'

        within '.form-actions' do
          click_on "Login"
        end
      end

      specify 'he should stay on the login page' do
        current_path.should eql sessions_path(:locale => 'en')
      end

      specify 'he should see a flash notifiying him of incorrect credentials' do
        find '.alert strong', :text => "Invalid username or password."
      end
    end

    describe 'with an incorrect password' do
      before do
        fill_in "Username", :with => user.username
        fill_in "Password", :with => 'nopenope'

        within '.form-actions' do
          click_on "Login"
        end
      end

      specify 'he should stay on the login page' do
        current_path.should eql sessions_path(:locale => 'en')
      end

      specify 'he should see a flash notifiying him of incorrect credentials' do
        find '.alert strong', :text => "Invalid username or password."
      end
    end

    describe 'with an incorrect username and password' do
      before do
        fill_in "Username", :with => 'mallory'
        fill_in "Password", :with => 'nopenope'

        within '.form-actions' do
          click_on "Login"
        end
      end

      specify 'he should stay on the login page' do
        current_path.should eql sessions_path(:locale => 'en')
      end

      specify 'he should see a flash notifiying him of incorrect credentials' do
        find '.alert strong', :text => "Invalid username or password."
      end
    end
  end
end

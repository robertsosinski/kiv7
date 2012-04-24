require 'spec_helper'

describe 'when a user goes to the welcome page', :js => true do
  describe 'from the root path' do
    before do
      visit '/'
    end

    specify 'he should be sent to the english welcome page' do
      current_path.should eql pages_path(:action => 'welcome', :locale => 'en')
    end
  end

  describe 'directly' do
    before do
      visit pages_path(:action => 'welcome', :locale => 'en')
    end

    specify 'he should see a page with the proper elements' do
      within '.hero-unit' do
        find 'h1', :text => "Welcome!"

        find 'a.btn-primary', :text => "Signup"
        find 'a.btn', :text => "Login"
      end
    end

    describe 'and clicks a signup button' do
      describe 'in the navbar' do
        before do
          within '.navbar' do
            click_on "Signup"
          end
        end

        specify 'he should go to the singup page' do
          current_path.should eql new_users_path(:locale => 'en')
        end
      end

      describe 'in the hero-unit' do
        before do
          within '.hero-unit' do
            click_on "Signup"
          end
        end

        specify 'he should go to the signup page' do
          current_path.should eql new_users_path(:locale => 'en')
        end
      end
    end

    describe 'and clicks a login button' do
      describe 'in the navbar' do
        before do
          within '.navbar' do
            click_on "Login"
          end
        end

        specify 'he should go to the login page' do
          current_path.should eql new_sessions_path(:locale => 'en')
        end
      end
      
      describe 'in the hero-unit' do
        before do
          within '.hero-unit' do
            click_on "Login"
          end
        end

        specify 'he should go to the login page' do
          current_path.should eql new_sessions_path(:locale => 'en')
        end
      end
    end
  end
end

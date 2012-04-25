require 'spec_helper'

describe 'when a user goes to the lists page', :js => true do
  describe 'after logging in' do
    let(:current_user) { Factory(:user) }

    before do
      visit new_sessions_path(:locale => 'en')

      fill_in "Username", :with => current_user.username
      fill_in "Password", :with => 'hushhush'

      within '.form-actions' do
        click_on "Login"
      end
      
      visit lists_path(:locale => 'en')
    end
    
    describe 'and creates a new task' do
      before do
        find('#new-task').fill_in 'name', :with => "Wash clothes"
        find('a.create').click
      end
      
      describe 'he should see that' do
        specify 'a new task is created' do
          find('#tasks .task input').value.should eql "Wash clothes"
        end

        specify 'the task should not be marked as done' do
          find('#tasks .task i.icon-star-empty')
        end

        specify 'the task blurb should show that one task is left' do
          page.should have_content 'has 1 task left'
        end
      end
    end
  end
end
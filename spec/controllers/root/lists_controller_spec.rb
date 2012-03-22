require 'spec_helper'

describe Root::ListsController do
  include MockWarden
  
  describe '#show' do
    context 'when logged in' do
      before do
        logged_in_as Factory.build(:user)
        get :show
      end
      
      it 'should show the list page' do
        response.should be_success
      end
    end
    
    context 'when not logged in' do
      before do
        not_logged_in
        get :show
      end
      
      it 'should redirect the user to the login page' do
        response.should be_redirect
      end
    end
  end
end

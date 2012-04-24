require 'spec_helper'

describe Api::V1::TasksController do
  include MockWarden
  
  describe '#index' do
    let(:user) { Factory(:user) }
    
    before do
      3.times { Factory(:task, :user => user) }
    end
    
    context 'when logged in' do
      before do
        logged_in_as user
        get :index
      end
      
      it 'should show the list page' do
        response.should be_success
      end
    end
    
    context 'when not logged in' do
      before do
        not_logged_in
        get :index
      end
      
      it 'should redirect the user to the login page' do
        response.should be_unauthorized
      end
    end
  end
end

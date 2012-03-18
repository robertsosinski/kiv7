require 'spec_helper'

describe Root::SessionsController do
  include Warden::Test::Helpers
  
  describe '#show' do
    context 'when a user is logged in' do
      before do
        get :show
      end
      
      it 'should return a json with "_csrf_token" and "session_id"' do
      end
    end
    
    context 'when a user is not logged in' do
      before do
        login_as "alice"
        get :show
      end
      
      it 'should return a json with "_csrf_token" and "session_id"' do
      end
    end
  end
end

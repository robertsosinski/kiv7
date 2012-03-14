require 'spec_helper'

describe User do
  describe 'when created' do
    let(:user) { User.new }
    
    context 'with a name, password and password_confirmation' do
      before do
        user.name = 'alice'
        user.password = 'hushhush'
        user.password_confirmation = 'hushhush'
      end

      it 'should be valid' do
        user.should be_valid
        user.save.should be_true
        
        user.authenticate('hushhush').should be_true
        user.authenticate('nopenope').should be_false
      end
    end
    
    context 'with a name only' do
      before do
        user.name = 'alice'
      end
      
      it 'should not be valid' do
        user.should_not be_valid
      end
    end
    
    context 'with a name, password and wrong password_confirmation' do
      before do
        user.name = 'alice'
        user.password = 'hushhush'
        user.password_confirmation = 'nopenope'
      end
      
      it 'should not be valid' do
        user.should_not be_valid
      end
    end
  end
  
  describe 'when mass assigned whitelisted attributes' do
    let(:user) { User.new(:name => 'alice', :password => 'hushhush', :password_confirmation => 'hushhush') }
    
    it 'those attributes should be set' do
      user.name.should == 'alice'
      user.password.should == 'hushhush'
      user.password_confirmation.should == 'hushhush'
    end
  end
  
  describe 'when mass assigned non-whitelisted attributes' do
    it 'should raise an error' do
      expect { User.new(:admin => true) }.to raise_error
    end
  end
end

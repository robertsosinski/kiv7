require 'spec_helper'

describe User do
  describe '.new' do
    let(:user) { User.new }
    
    context 'with a username, password and password_confirmation' do
      before do
        user.username = 'alice'
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
    
    context 'with a username only' do
      before do
        user.username = 'alice'
      end
      
      it 'should not be valid' do
        user.should_not be_valid
      end
    end
    
    context 'with a username, password and wrong password_confirmation' do
      before do
        user.username = 'alice'
        user.password = 'hushhush'
        user.password_confirmation = 'nopenope'
      end
      
      it 'should not be valid' do
        user.should_not be_valid
      end
    end
    
    context 'when mass assigned whitelisted attributes' do
      let(:user) { User.new(:username => 'alice', :password => 'hushhush', :password_confirmation => 'hushhush') }

      it 'those attributes should be set' do
        user.username.should == 'alice'
        user.password.should == 'hushhush'
        user.password_confirmation.should == 'hushhush'
      end
    end

    context 'when mass assigned non-whitelisted attributes' do
      it 'should raise an error' do
        expect { User.new(:admin => true) }.to raise_error
      end
    end
  end
  
  describe '.authenticate' do
    before do
      @alice = Factory(:user)
      @bob   = Factory(:user, :username => 'bob', :password => 'password')
    end
    
    let(:alice) { @alice }
    let(:bob) { @bob }
    
    context 'when passed the right username' do
      context 'and the right password' do
        it 'should return the correct user' do
          User.authenticate('alice', 'hushhush').should == alice
          User.authenticate('bob', 'password').should == bob
        end
      end
      
      context 'and the wrong password' do
        it 'should return false' do
          User.authenticate('alice', 'password').should be_false
          User.authenticate('bob', 'hushhush').should be_false
        end
      end
    end
    
    context 'when passed the wrong username' do
      context 'and a password that another user has' do
        it 'should return nil' do
          User.authenticate('charlie', 'hushhush').should be_false
        end
      end
      
      context 'and a password no user has' do
        it 'should return nil' do
          User.authenticate('charlie', 'nopenope').should be_false
        end
      end
    end
  end
  
  describe '#authenticate' do
    let(:user) { Factory(:user) }
    
    context 'when passed the correct password' do
      it 'should return true' do
        user.authenticate("hushhush").should be_true
      end
      
    end
    
    context 'when passed the wrong password' do
      it 'should return false' do
        user.authenticate("nopenote").should be_false
      end
    end
  end
end

require 'spec_helper'

describe Task do
  let(:user) { create(:user) }
  let(:open_task) { task = Task.new(:name => "wash dishes"); task.user = user; task }
  let(:done_task) { task = Task.new(:name => "iron clothes", :done => true); task.user = user; task }
  
  describe 'open task' do
    it 'should have a name' do
      open_task.name.should == "wash dishes"
    end
    
    it 'should not be marked as done' do
      open_task.done.should be_false
    end
    
    context 'when toggled' do
      before do
        open_task.toggle
      end
      
      it 'should be done' do
        open_task.done.should be_true
      end
    end
  end
  
  describe 'done task' do
    it 'should have a name' do
      done_task.name.should == "iron clothes"
    end
    
    it 'should not be marked as done' do
      done_task.done.should be_true
    end
    
    context 'when toggled' do
      before do
        done_task.toggle
      end
      
      it 'should be done' do
        open_task.done.should be_false
      end
    end
  end
end

alice = User.create(:username => 'alice', :password => 'hushhush')

bob = User.new(:username => 'bob', :password => 'password')
bob.admin = true
bob.save

alice.tasks.create(:name => "iron clothes", :done => true)
alice.tasks.create(:name => "wash dishes")
alice.tasks.create(:name => "do laundry")

bob.tasks.create(:name => "take out trash", :done => true)
bob.tasks.create(:name => "unclog toilet")
bob.tasks.create(:name => "fix dishwasher")
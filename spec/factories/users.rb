FactoryGirl.define  do
  sequence :username do |n|
    "alice#{n}"
  end
  
  factory :user do
    username
    password 'hushhush'
    password_confirmation {|u| u.password}
  end
  
  factory :admin, :parent => :user do
    admin true
  end
end

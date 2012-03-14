FactoryGirl.define  do
  sequence :name do |n|
    "android-#{n}"
  end
  
  factory :user do
    name 
    password 'hushhush'
    password_confirmation {|u| u.password}
  end
  
  factory :admin, :parent => :user do
    admin true
  end
end
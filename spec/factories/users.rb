FactoryGirl.define  do
  factory :user do
    name 'alice'
    password 'hushhush'
    password_confirmation {|u| u.password}
  end
  
  factory :admin, :parent => :user do
    admin true
  end
end
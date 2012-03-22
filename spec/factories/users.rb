FactoryGirl.define  do
  factory :user do
    sequence(:username) { |n| "alice#{n}" }
    password 'hushhush'
    password_confirmation {|u| u.password}
  end
  
  factory :admin, :parent => :user do
    admin true
  end
end
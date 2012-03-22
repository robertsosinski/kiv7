FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| puts 'x'; "task#{n}" }
  end
end
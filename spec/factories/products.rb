FactoryGirl.define do
  factory :product do
    name "TestGuitar"
    description "A description about a test guitar"
    user_id 1
    association :user, factory: :user
  end
end

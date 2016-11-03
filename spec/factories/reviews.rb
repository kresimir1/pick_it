FactoryGirl.define do
  factory :review do
    sequence(:username) {|n| "John" }
    title "A very good guitar"
    content "that is all I have to say about this one"
    sequence(:product_id) {|n| "1" }
    sequence(:user_id) {|n| "1" }
  end
end

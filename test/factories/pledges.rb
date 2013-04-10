FactoryGirl.define do
  factory :pledge do
    amount 100
    association :user
    association :project
  end
end

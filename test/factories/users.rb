# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Karl"
    last_name "Danninger"
    sequence(:email) {|n| "karl#{n}@okgrow.com" } 
    password "Karl.is.king!!"
  end
end

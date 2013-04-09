# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    user
    title "Wifi-enabled Shoes"
    teaser "Control your minions!"
    description "These are the coolest shoes ever"
    goal 12000
  end
end

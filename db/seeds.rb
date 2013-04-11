# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Project.destroy_all

user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "jdoe111")

50.times do |i|
    user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}",
        description: "description #{i}", goal: 13000)
end

user2 = User.create!(first_name: "Khurram", last_name: "Virani", email: "kvirani@bitmakerlabs.com", password: "kviranikvirani")
5.times do |i|
    user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}",
        description: "description #{i}", goal: 13000)
end



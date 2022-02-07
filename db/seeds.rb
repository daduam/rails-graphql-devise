# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

project_titles = 10.times.map { Faker::Internet::domain_word }

split = 0.4
offset = project_titles.length * split

project_users = {
  "leo@example.com" => project_titles[0, offset],
  "bob@example.com" => project_titles[offset..-1]
}

project_users.each do  |email, projects|
  user = User.new(email: email, password: "secret")
  projects.each { |title| user.projects.build(title: title) }
  user.save
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  ["a@a.com", "aaaaaaaa", "aaaaaaaa"],
  ["b@b.com", "bbbbbbbb", "bbbbbbbb"],
  ["c@c.com", "cccccccc", "cccccccc"],
  ["d@d.com", "dddddddd", "dddddddd"]
]

users.each do | a, b, c |
  User.create!(email: a, password: b, password_confirmation: c)
end

#seed profiles

profiles = [
  [1, "Bob", "Dole", "bobbydole"],
  [2, "Bill", "Clinton", "prez42"],
  [3, "Al", "Gore", "manbearpig"],
  [4, "Ralph", "Nader", "independentmofo"]
]

profiles.each do | a, b, c, d |
  Profile.create(user_id: a, fname: b, lname: c, username: d)
end

#seed boats

boats = [
  [1, "SS Titanic", 100, "Lisbon"],
  [1, "SS Lusitania", 150, "London"],
  [2, "SS Your Mom", 125, "Amsterdam"],
  [2, "SS Lewinksy", 75, "New York"],
  [3, "SS Super Serial", 200, "Los Angeles"],
  [3, "SS Superhighway", 125, "New Orleans"],
  [4, "SS Safe at Any Speed", 50, "Buenos Aires"],
  [4, "SS Seatbelt", 225, "Dubai"]
]

boats.each do | a, b, c, d |
  Boat.create(user_id: a, name: b, capacity: c, cur_loc: d)
end

#jobs seed

jobs = [
  ["Bring Tractors from NY to LA", 150, "Tractors", "New York", 100000, "Los Angeles"]
]

jobs.each do | a, b, c, d, e, f |
  Job.create(name: a, ctn_need: b, cargo: c, origin: d, cost: e, destination: f)
end 
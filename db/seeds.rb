# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#destroy all tables
User.destroy_all
Profile.destroy_all
Boat.destroy_all
Job.destroy_all
Follower.destroy_all

#seed users

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
  
x = User.first.id  

profiles = [
  [x, "Bob", "Dole", "bobbydole"],
  [x + 1, "Bill", "Clinton", "prez42"],
  [x + 2, "Al", "Gore", "manbearpig"],
  [x + 3, "Ralph", "Nader", "independentmofo"]
]



profiles.each do | a, b, c, d |
  Profile.where(user_id: a).first.update(fname: b, lname: c, username: d)
end

#seed boats

boats = [
  [x, "SS Titanic", 100, "Lisbon"],
  [x, "SS Lusitania", 150, "London"],
  [x + 1, "SS Your Mom", 125, "Amsterdam"],
  [x + 1, "SS Lewinksy", 75, "New York"],
  [x + 2, "SS Super Serial", 200, "Los Angeles"],
  [x + 2, "SS Superhighway", 125, "New Orleans"],
  [x + 3, "SS Safe at Any Speed", 50, "Buenos Aires"],
  [x + 3, "SS Seatbelt", 225, "Dubai"]
]

boats.each do | a, b, c, d |
  Boat.create(user_id: a, name: b, capacity: c, cur_loc: d)
end

#jobs seed

jobs = [
  ["Tractors from NY to LA", 150, "Tractors. We got your John Deeres, your Caterpillars, and all those other brands you know and love.", "New York", 100000, "Los Angeles"],
  ["Shoes from NY to LA", 75, "Shoes. OMG Shoes. Converse, Nike, Adidas, Jordans, you name it, we got it. Note: These may or may not be authentic.", "New York", 15000, "Los Angeles"],
  ["Cars from Amsterdam to Lisbon", 150, "Cars.  We got your Beamers, your Benzes, your Audis, and every other german car your typical rich douche might drive.", "Amsterdam", 30000, "Lisbon"]
]

jobs.each do | a, b, c, d, e, f |
  Job.create(name: a, ctn_need: b, cargo: c, origin: d, cost: e, destination: f)
end 


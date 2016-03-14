class Boat < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :followers

  CITIES = ["New York", "Los Angeles", "Washington", "Portland", "Lisbon", "London", "Amsterdam", "Cape Town", "Oslo", "Sydney", "Buenos Aires", "Lima"]

  validates :cur_loc, inclusion:{in: CITIES, message: "city invalid"}
end

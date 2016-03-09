class Job < ActiveRecord::Base
  belongs_to :boat

  CITIES = ["New York", "Los Angeles", "Washington", "Portland", "Lisbon", "London", "Amsterdam", "Cape Town", "Oslo", "Sydney", "Buenos Aires", "Lima"]

  validates :origin, inclusion: {in: CITIES, "Origin is not a valid destination."}
  validates :destination, inclusion: {in: CITIES, message: "Destination is not a valid city."}
end

class Job < ActiveRecord::Base
  belongs_to :boat

  CITIES = ["New York", "Los Angeles", "Washington", "Portland", "Lisbon", "London", "Amsterdam", "Cape Town", "Oslo", "Sydney", "Buenos Aires", "Lima"]

  validates :origin, inclusion: {in: CITIES, message: "Origin is not a valid destination."}
  
  validates :destination, inclusion: {in: CITIES, message: "Destination is not a valid city."}

  validates :ctn_need, numericality: {greater_than_or_equal_to: 1, message: "Containers Needed Must Be Greater Than 1"}

  validates :ctn_need, numericality: {only_integer: true, message: "Containers Needed Must Be An Integer"}

  validates :cargo, length: { minimum: 50, message: "Cargo Description Must Be At Least 50 Characters" }

  validates :cost, numericality: {greater_than: 1000, message: "Cost Must Be Greater Than $1,000" }  

  validates :name, uniqueness: true

  scope :assigned, -> {where.not("boat_id IS NOT NULL")}

  scope :unassigned, -> {where("boat_id IS NULL")}

  def assignment_status
    if boat_id != nil
      "Assigned"
    else 
      "Unassigned"
    end
  end
  
end

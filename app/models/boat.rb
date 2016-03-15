class Boat < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :followers

  has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/boat.jpg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  CITIES = ["New York", "Los Angeles", "Washington", "Portland", "Lisbon", "London", "Amsterdam", "Cape Town", "Oslo", "Sydney", "Buenos Aires", "Lima"]

  validates :cur_loc, inclusion:{in: CITIES, message: "city invalid"}
end

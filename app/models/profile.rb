class Profile < ActiveRecord::Base
  belongs_to :user

  def full_name
    "#{fname} #{lname}"
  end
end

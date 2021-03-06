class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :boats, dependent: :destroy
  has_many :followers

  # has_many :followers, dependent: :destroy

  after_create do
    Profile.create(user_id: self.id)
  end
end

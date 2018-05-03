class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :posts, dependent: :destroy


#  def feed
#    following_ids = "SELECT followed_id FROM relationships
#                     WHERE follower_id = :user_id"
#    Micropost.where("user_id IN (#{following_ids}) OR user_id= :user_id",
#                                                      user_id: id)
#  end
end

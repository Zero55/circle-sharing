# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :posts, dependent: :destroy
  has_many :active_circles, class_name: 'Circle',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :passive_circles, class_name: 'Circle',
                                   foreign_key: 'followed_id',
                                   dependent:  :destroy
  has_many :following, through: :active_circles,  source: :followed
  has_many :followers, through: :passive_circles, source: :follower
  has_many :shares
  has_many :peeps

  
  def follow(other_user)
    active_circles.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_circles.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

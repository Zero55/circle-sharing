# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :shares

  #validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 142 }
  #validates :image, attached_file: true

  has_one_attached :image

  #callbacks
  before_create :add_expire_date

  after_create :share_post

  def share_post
    Share.create( user_id: user_id, post_id: id )
  end

  def self.following_posts(user)
    following_ids = user.following.pluck(:id)
    posts = Post.all.where(user_id: following_ids)
    return posts
  end
end

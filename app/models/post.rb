# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 142 }
  #validates :image, attached_file: true
  has_one_attached :image
  before_create :add_expire_date
  has_many :pushed_posts

  def self.following_posts(user)
    following_ids = user.following.pluck(:id)
    posts = Post.all.where(user_id: following_ids)
    return posts
  end

  def push_post(user)
    post_id = Post.id
    pushed_post = PushedPost.create(:user_id => current_user.id, :post_id => post_id)
  end

  def self.following_pushed_posts(user)
    following_ids = user.following.pluck(:id)
    posts = pushed_posts(follower_ids)
  end

  def self.pushed_posts(follower_ids)
    fids = follower_ids.join(',')
    all.joins(:pushed_posts).where('pushed_posts.user_id IN (?)', fids)
  end

  def expired?
    unless !post.expire == []
      Time.now >= self.expire ? true : false
    end
  end

  def opened
    'Opened'
  end

  def seen?
    true
  end

  private
    def add_expire_date
      self.expire = self.created_at + 48.hours
    end
end

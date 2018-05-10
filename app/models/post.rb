# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 142 }
  validates :image, attached_file: true
  has_one_attached :image
  before_create :add_expire_date


  def expired?
    Time.now >= self.expire ? true : false
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

# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 142 }

  validates :image, attached_file: true
  # validates :image_presence

  has_one_attached :image

  # def self.image_presence
  #   if image.attached?
  #     errors.add('image is not her ')
  #   end
  # end

  def opened
    'Opened'
  end

  def seen?
    true
  end
end

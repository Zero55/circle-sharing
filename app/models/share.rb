class Share < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :peeps

  scope :followed, -> (user) { all.where(user_id: user.followers.pluck(:id)) }

  validates_presence_of :user_id, :post_id

  def peeped?(user)
    user.peeps.where(post_id: id)
  end

  def expired?
    created_at + 48.hours > Time.current
  end

end

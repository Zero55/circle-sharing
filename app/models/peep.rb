class Peep < ApplicationRecord
  belongs_to :user
  belongs_to :share
end

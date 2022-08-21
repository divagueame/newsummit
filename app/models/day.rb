class Day < ApplicationRecord
  belongs_to :user
  validates :date, :user_id, presence: true
  validates :time, presence: true
  
end

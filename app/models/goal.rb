class Goal < ApplicationRecord
  belongs_to :user
  validates :start, :end, :date, :user_id, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days, dependent: :destroy
  has_one :goal, dependent: :destroy
  after_create -> { add_initial_days_to_user }
  after_create -> { add_default_goal_to_user }

  private 
  
  def add_initial_days_to_user
    days = (Goal.new.date - DateTime.now).to_i/1.day
    days_arr = []
    days.times do |i|
      day_hash = {date: DateTime.current + i, user_id: self.id}
      days_arr.push(day_hash)
    end
    Day.create(days_arr)
  end

    def add_default_goal_to_user
      self.build_goal.save
    end
end

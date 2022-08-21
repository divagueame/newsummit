class User < ApplicationRecord
  include GoalCalculator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days, dependent: :destroy
  has_one :goal, dependent: :destroy
  
  after_create -> { set_daily_goals(self.id) }
  after_create -> { add_default_goal_to_user }

  private 

  def add_default_goal_to_user
    self.build_goal.save
  end
end

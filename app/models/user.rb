class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days, dependent: :destroy
  
  after_create  :add_initial_days_to_user 

  private 
  
  def add_initial_days_to_user
    days_arr = []
    365.times do |i|
      day_hash = {date: DateTime.current + i, user_id: self.id}
      days_arr.push(day_hash)
    end
    Day.create(days_arr)
  end
end

module GoalCalculator
  def set_daily_goals(user_id, start_seconds = Goal.new.start, end_seconds = Goal.new.end, target_date = Goal.new.date)

    days = (target_date - DateTime.now).to_i/1.day
    daily_increase = end_seconds / days

    days_arr = []
    days.times do |i|
      day_hash = {
        date: DateTime.current + i,
        user_id: user_id,
        time: i * daily_increase
      }
      days_arr.push(day_hash)
    end
    Day.create(days_arr)
  end
end
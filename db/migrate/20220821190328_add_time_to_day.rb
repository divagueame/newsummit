class AddTimeToDay < ActiveRecord::Migration[7.0]
  def change
    add_column :days, :time, :integer, null: false, default: 0
  end
end

class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.integer :start, default: 0, null: false
      t.integer :end, default: 2000, null: false
      t.datetime :date, default: 1.year.from_now, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :student
      t.string :location
      t.integer :income
      t.integer :fnb
      t.integer :transport
      t.integer :duration

      t.timestamps
    end
  end
end

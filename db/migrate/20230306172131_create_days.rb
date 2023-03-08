class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :menu, null: false, foreign_key: true
      t.integer :weekday

      t.timestamps
    end
  end
end

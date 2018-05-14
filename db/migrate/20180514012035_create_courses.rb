class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :pic
      t.integer :hours
      t.timestamps
    end
  end
end

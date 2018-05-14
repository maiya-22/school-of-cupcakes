class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :pic
      t.string :profile
      t.integer :age
      t.string :education
      t.integer :salary
      t.string :person_type

      t.timestamps
    end
  end
end

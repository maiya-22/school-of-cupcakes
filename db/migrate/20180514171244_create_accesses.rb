class CreateAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses do |t|
      t.string :user_name
      t.string :password
      t.string :role
      t.belongs_to :teacher, index: true
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end

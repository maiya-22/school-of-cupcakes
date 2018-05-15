class CreateCohortsStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts_students do |t|
      t.integer :cohort_id
      t.integer :student_id

      t.timestamps
    end
  end
end

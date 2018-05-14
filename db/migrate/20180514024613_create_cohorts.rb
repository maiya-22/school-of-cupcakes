class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start
      t.datetime :end
      t.belongs_to :teacher, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end

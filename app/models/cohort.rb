class Cohort < ApplicationRecord
    belongs_to :teacher
    has_many :cohorts_students, dependent: :destroy
    has_many :students, :through => :cohorts_students
end

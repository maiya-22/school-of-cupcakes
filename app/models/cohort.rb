class Cohort < ApplicationRecord
    belongs_to :teacher
    belongs_to :course
    has_many :cohorts_students, dependent: :destroy
    has_many :students, :through => :cohorts_students
end

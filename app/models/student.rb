class Student < ApplicationRecord
    has_many :cohorts_students, dependent: :destroy
    has_many :cohorts, :through => :cohorts_students
end

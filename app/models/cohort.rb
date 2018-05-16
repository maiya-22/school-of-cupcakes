class Cohort < ApplicationRecord
    belongs_to :teacher
    belongs_to :course
    has_many :cohorts_students, dependent: :destroy
    has_many :students, :through => :cohorts_students

    # note: try this to set default teacher and course:
    # after_initialize :init
    
    # def init
    #     self.course  ||= 1           
    #     self.teacher ||= 1 
    # end
      
end

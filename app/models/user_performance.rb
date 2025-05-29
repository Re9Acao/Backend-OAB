class UserPerformance < ApplicationRecord
  belongs_to :user
  belongs_to :law_area
  belongs_to :evaluation

  enum question_type:{
    objective: 1, 
    discursive: 2, 
    dissertation: 3
  }

  validates :question_type, :correct_count, :incorrect_count, :total_questions, presence:true
end

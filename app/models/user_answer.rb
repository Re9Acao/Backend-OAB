class UserAnswer < ApplicationRecord
  belongs_to :evaluation_question
  belongs_to :user
  belongs_to :standard_answer

  enum question_type{
    objective: 1, 
    discursive: 2, 
    dissertation; 3
  }

  validates :question_type, presence:true
end

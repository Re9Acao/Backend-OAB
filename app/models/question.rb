class Question < ApplicationRecord
  belongs_to :law_area
  has_one :standard_answer, dependent: :destroy
  has_many :evaluation_questions
  has_many :user_answers
  
  enum question_type: {
    objective: 1, 
    discursive: 2, 
    dissertation: 3
  }, _default: :objective

  validates :question_type, presence: true
end

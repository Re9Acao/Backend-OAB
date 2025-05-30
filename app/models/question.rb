class Question < ApplicationRecord
  belongs_to :law_area
  has_many :standard_answers, dependent: :destroy
  has_many :evaluation_questions
  has_many :user_answers
  
  enum question_type: {
    objective: 1, 
    discursive: 2, 
    dissertation: 3
  }, _default: :objective

  validates :question_type, presence: true

  def usable_for_evaluation?
    return true if objective?
    standard_answers.where(is_active: true).exists?
  end

end

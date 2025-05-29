class EvaluationQuestion < ApplicationRecord
  belongs_to :evaluation
  belongs_to :question
  has_many :user_answers
end

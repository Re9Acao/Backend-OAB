class StandardAnswer < ApplicationRecord
  belongs_to :question
  has_many :user_answers, foreign_key: :standard_answer_id

  validates :text, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end

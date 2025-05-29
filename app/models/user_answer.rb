class UserAnswer < ApplicationRecord
  belongs_to :evaluation_question
  belongs_to :user
  belongs_to :standard_answer

  enum question_type{
    objective: 1, 
    discursive: 2, 
    dissertation; 3
  }

  validates :question_type, presence: true
  validate :answer_matches_type

  
  private
  def answer_matches_type
    if objective? && selected_option.blank?
      errors.add(:selected_option, "é obrigatório para questões objetivas")
    elsif (discursive? || dissertation?) && written_answer.blank?
      errors.add(:written_answer, "é obrigatório para questões discursivas/dissertativas")
    end
  endprivate
  def answer_matches_type
    if objective? && selected_option.blank?
      errors.add(:selected_option, "é obrigatório para questões objetivas")
    elsif (discursive? || dissertation?) && written_answer.blank?
      errors.add(:written_answer, "é obrigatório para questões discursivas/dissertativas")
    end
  end
end

class Evaluation < ApplicationRecord
  belongs_to :user
  has_many :evaluation_questions
  has_many :evaluation_law_areas
  has_many :questions, through: :evaluation_questions

  def validate_question(question)
    question.correct_option = question.chosen_option == question.question.correct_answer
    question.save
  end

  def update_score    
    true_count = EvaluationQuestion.where(evaluation_id: self.id, correct_option: true).count
    self.update(correct_score: true_count)
  end

  def get_questions_answered(condiction)
    if condiction == "T"
      EvaluationQuestion.where(evaluation_id: self.id, correct_option: true)
    elsif condiction == 'F'
      EvaluationQuestion.where(evaluation_id: self.id, correct_option: false)
    end
  end
  
  def follow_up
    number_questions = EvaluationQuestion.where(evaluation_id: self.id).count
    success_questions = EvaluationQuestion.where(evaluation_id: self.id, correct_option: true).count
    incorrect_questions = EvaluationQuestion.where(evaluation_id: self.id, correct_option: false).count
    percentage_success = (success_questions.to_f / number_questions.to_f) * 100
    results = {
      "total_questions": number_questions,
      "total_success": success_questions,
      "total_incorrect": incorrect_questions,
      "performance": percentage_success
    }
    return results
  end
end


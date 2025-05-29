class RemoveChosenOptionAndCorrectOptionFromEvaluationQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :evaluation_questions, :chosen_option, :integer
    remove_column :evaluation_questions, :correct_option, :boolean
  end
end

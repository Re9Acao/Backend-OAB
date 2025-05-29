class AddQuestionTypeToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :question_type, :integer, default: 1, null: false
  end
end

class CreateEvaluationQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluation_questions do |t|
      t.integer :chosen_option
      t.boolean :correct_option
      t.references :evaluation, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end

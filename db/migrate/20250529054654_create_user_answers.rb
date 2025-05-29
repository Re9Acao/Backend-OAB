class CreateUserAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :user_answers do |t|
      t.references :evaluation_question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :question_type, null: false
      t.string :selected_option
      t.text :written_answer

      t.timestamps
    end
  end
end

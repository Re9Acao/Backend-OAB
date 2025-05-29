class CreateUserPerformances < ActiveRecord::Migration[7.1]
  def change
    create_table :user_performances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :law_area, null: false, foreign_key: true
      t.references :evaluation, null: false, foreign_key: true
      t.integer :question_type, null: false
      t.integer :correct_count, null: false, default:0
      t.integer :incorrect_count, null: false, default:0
      t.integer :total_questions, null: false, default:0

      t.timestamps
    end
  end
end

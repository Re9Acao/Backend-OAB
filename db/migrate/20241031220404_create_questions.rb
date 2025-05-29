class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :evaluation_board
      t.string :year
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.string :option_5
      t.integer :correct_answer
      t.boolean :available, default: true
      t.references :law_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateStandardAnserws < ActiveRecord::Migration[7.1]
  def change
    create_table :standard_anserws do |t|
      t.references :question, null: false, foreign_key: true
      t.text :text
      t.boolean :is_active

      t.timestamps
    end
  end
end

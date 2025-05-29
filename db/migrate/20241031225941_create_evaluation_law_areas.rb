class CreateEvaluationLawAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluation_law_areas do |t|
      t.references :evaluation, null: false, foreign_key: true
      t.references :law_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end

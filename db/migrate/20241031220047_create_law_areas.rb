class CreateLawAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :law_areas do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

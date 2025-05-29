class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.datetime :expires_at
      t.boolean :finished, default: false
      t.datetime :create_at, null: false
      t.datetime :update_at, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

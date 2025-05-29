class RemoveCreateAndUpdateAtFromEvaluations < ActiveRecord::Migration[7.1]
  def change
    remove_column :evaluations, :create_at, :datetime
    remove_column :evaluations, :update_at, :datetime
  end
end

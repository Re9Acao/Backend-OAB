class AddCorrectScoreToEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :evaluations, :correct_score, :integer
  end
end

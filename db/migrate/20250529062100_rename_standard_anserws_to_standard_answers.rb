class RenameStandardAnserwsToStandardAnswers < ActiveRecord::Migration[7.1]
  def change
    if table_exists?(:standard_anserws)
      rename_table :standard_anserws, :standard_answers
    end

    if column_exists?(:user_answers, :standard_anserw_id)
      rename_column :user_answers, :standard_anserw_id, :standard_answer_id
    end
  end
end

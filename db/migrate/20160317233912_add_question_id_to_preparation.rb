class AddQuestionIdToPreparation < ActiveRecord::Migration
  def change
    add_column :preparations, :question_id, :integer
  end
end

class AddColumnRequirementIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :requirement, foreign_key: true
  end
end

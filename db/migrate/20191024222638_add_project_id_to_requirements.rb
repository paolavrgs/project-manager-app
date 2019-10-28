class AddProjectIdToRequirements < ActiveRecord::Migration[5.2]
  def change
    add_reference :requirements, :project, foreign_key: true
  end
end

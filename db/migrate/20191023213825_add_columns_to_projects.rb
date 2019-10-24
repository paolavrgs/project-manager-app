class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :start_date, :datetime
    add_column :projects, :due_date, :datetime
    add_column :projects, :techs, :string, array: true, default: []
  end
end

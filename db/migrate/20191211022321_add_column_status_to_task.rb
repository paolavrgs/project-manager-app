class AddColumnStatusToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :boolean, default: false
  end
end

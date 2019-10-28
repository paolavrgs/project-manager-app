class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :level
      t.string :techs, array: true, default: []

      t.timestamps
    end
  end
end

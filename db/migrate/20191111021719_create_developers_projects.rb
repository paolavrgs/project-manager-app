class CreateDevelopersProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :developers_projects do |t|
      t.references :project, foreign_key: true
      t.references :developer, foreign_key: true
    end
  end
end

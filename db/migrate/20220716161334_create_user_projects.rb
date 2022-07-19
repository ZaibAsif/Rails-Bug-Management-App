class CreateUserProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end

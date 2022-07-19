class RenameUserIdInDevelperProject < ActiveRecord::Migration[5.2]
  def change
    rename_column :developer_projects, :user_id, :developer_id
  end
end

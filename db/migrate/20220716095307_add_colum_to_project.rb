class AddColumToProject < ActiveRecord::Migration[5.2]
  def change
    add_column  :projects, :manager_id, :integer
    add_column  :projects, :developer_ids, :integer
  end
end

class AddAvatarToBug < ActiveRecord::Migration[5.2]
  def change
      add_column :bugs, :avatar_file_name,    :string
      add_column :bugs, :avatar_content_type, :string
      add_column :bugs, :avatar_file_size,    :integer
      add_column :bugs, :avatar_updated_at,   :datetime
  end
end

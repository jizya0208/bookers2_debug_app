class AddColumnToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :describe, :text  
    add_column :groups, :group_image_id, :string
    add_column :users, :owner, :boolean, default: false
  end
end

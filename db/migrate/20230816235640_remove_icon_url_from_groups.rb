class RemoveIconUrlFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :icon_url
  end
end

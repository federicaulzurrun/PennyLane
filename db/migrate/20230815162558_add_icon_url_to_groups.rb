class AddIconUrlToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :icon_url, :string
  end
end

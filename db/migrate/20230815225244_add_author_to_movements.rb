class AddAuthorToMovements < ActiveRecord::Migration[7.0]
  def change
    add_column :movements, :author, :string
  end
end

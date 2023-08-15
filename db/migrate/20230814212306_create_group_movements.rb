class CreateGroupMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :group_movements do |t|
      t.references :group, null: false, foreign_key: true
      t.references :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end

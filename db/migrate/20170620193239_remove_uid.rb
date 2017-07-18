class RemoveUid < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :uid
  end
  def down
    add_column :users, :uid, :integer
  end
end

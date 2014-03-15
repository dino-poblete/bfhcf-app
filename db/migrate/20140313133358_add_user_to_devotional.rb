class AddUserToDevotional < ActiveRecord::Migration
  def change
    add_column :devotionals, :user_id, :integer
    add_index :devotionals, [:user_id, :created_at]
  end
end

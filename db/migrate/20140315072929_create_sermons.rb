class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.string :subtitle
      t.string :content
      t.date :posted_at
      t.integer :user_id

      t.timestamps
    end

    add_index :sermons, [:user_id, :created_at]
  end
end

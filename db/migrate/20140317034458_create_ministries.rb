class CreateMinistries < ActiveRecord::Migration
  def change
    create_table :ministries do |t|
      t.string :name

      t.timestamps
    end

    add_index :ministries, [:name]
  end
end
class CreateDevotionals < ActiveRecord::Migration
  def change
    create_table :devotionals do |t|
      t.string :title
      t.string :subtitle
      t.string :content
      t.date :posted_at

      t.timestamps
    end
  end
end

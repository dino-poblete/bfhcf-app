class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :ministry
      t.datetime :start_date
      t.datetime :end_date
      t.string :picture
      t.string :content

      t.timestamps
    end
  end
end

class ChangeContentFormatToText < ActiveRecord::Migration
  def change
    change_column :devotionals, :content, :text
    change_column :sermons, :content, :text
    change_column :events, :content, :text
    change_column :galleries, :content, :text
  end
end

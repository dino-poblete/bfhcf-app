class AddAnnouncementsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :announcement, :string
    add_column :events, :display_to_home, :boolean
  end
end

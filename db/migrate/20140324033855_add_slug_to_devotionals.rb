class AddSlugToDevotionals < ActiveRecord::Migration
  def change
    add_column :devotionals, :slug, :string

    add_index :devotionals, :slug, unique: true
  end

end

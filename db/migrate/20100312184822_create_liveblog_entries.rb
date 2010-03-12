class CreateLiveblogEntries < ActiveRecord::Migration
  def self.up
    create_table :liveblog_entries do |t|
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :liveblog_entries
  end
end

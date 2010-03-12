class AssociteLiveblogPagesWithPosts < ActiveRecord::Migration
  def self.up
    add_column :liveblog_entries, :liveblog_page_id, :integer
  end

  def self.down
  end
end

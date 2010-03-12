class CreateLiveblogPages < ActiveRecord::Migration
  def self.up
    create_table :liveblog_pages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :liveblog_pages
  end
end

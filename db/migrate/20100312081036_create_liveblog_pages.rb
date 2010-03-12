class CreateLiveblogPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :live_blog_title, :string, :null => true
    add_column :pages, :live_blog_description, :string, :null => true
    add_column :pages, :live_blog_event_uri, :string, :null => true
  end

  def self.down
    remove_column :pages, :live_blog_title
    remove_column :pages, :live_blog_description
    remove_column :pages, :live_blog_event_uri
  end
end

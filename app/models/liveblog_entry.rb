class LiveblogEntry < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :liveblog_page
end

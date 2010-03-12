# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class LiveblogExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/liveblog"

  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :liveblog
  #   end
  # end
  
  def activate
    # tab 'Content' do
    #   add_item "Liveblog", "/admin/liveblog", :after => "Pages"
    # end
  end
end

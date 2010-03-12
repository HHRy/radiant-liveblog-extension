require File.dirname(__FILE__) + '/../spec_helper'

describe LiveblogPage do
  before(:each) do
    @liveblog_page = LiveblogPage.new
  end

  it "should be valid" do
    @liveblog_page.should be_valid
  end
end

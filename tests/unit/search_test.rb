require 'test_helper'

class SearchTest < Minitest::Test
  def setup 
  	super
    @user = User.new

  end

  def test_search_format
    assert_includes(Search.format("bajirao mastani"), "Bajirao Mastani")
  end

end


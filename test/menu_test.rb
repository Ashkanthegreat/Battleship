require_relative 'test_helper.rb'
require './lib/menu.rb'


class MenuTest < Minitest::Test

  def setup
    @menu = Menu.new
  end

  def test_if_it_exists
    assert_instance_of Menu, @menu
  end

  
end

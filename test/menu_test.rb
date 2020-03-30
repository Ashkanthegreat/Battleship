require_relative 'test_helper.rb'
require './lib/menu.rb'


class MenuTest < Minitest::Test

  def setup
    @menu = Menu.new
  end

  def test_if_it_exists
    assert_instance_of Menu, @menu
  end

  def test_menu_response
    assert_equal "You hate to see it. -Tim", @menu.menu_response("q")
    assert_equal "You love to see it. -Tim", @menu.menu_response("p")
    assert_equal "Invalid Answer! Say more -Megan", @menu.menu_response("j")
  end


end

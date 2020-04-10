require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @item = items(:orange)
  end

  test "should redirect new when not logged in" do
    assert_no_difference 'Item.count' do
      post items_path, params: { item: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Item.count' do
      delete item_path(@item)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong item" do
    log_in_as(users(:michael))
    item = items(:ants)
    assert_no_difference 'Item.count' do
      delete item_path(item)
    end
    assert_redirected_to root_url
  end
end

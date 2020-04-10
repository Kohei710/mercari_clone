require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @item = @user.items.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "user id should be present" do
    @item.user_id = nil
    assert_not @item.valid?
  end

  test "content should be present" do
    @item.content = "   "
    assert_not @item.valid?
  end

  test "content should be at most 140 characters" do
    @item.content = "a" * 141
    assert_not @item.valid?
  end

  test "order should be most recent first" do
    assert_equal items(:most_recent), Item.first
  end
end

require 'test_helper'

class ItemsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "item interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 無効な送信
    assert_no_difference 'Item.count' do
      post items_path, params: {item: {content: "" } }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    content = "This item really ties the room together"
    assert_difference 'Item.count', 1 do
      post items_path, params: {item: {content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 投稿を削除する
    assert_select 'a', text: 'delete'
    first_item = @user.items.paginate(page: 1).first
    assert_difference 'Item.count', -1 do
      delete item_path(first_item)
    end
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

  test "item sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{@user.items.count} items", response.body
    # まだマイクロポストを投稿していないユーザー
    other_user = users(:malory)
    log_in_as(other_user)
    get root_path
    assert_match "0 items", response.body
    other_user.items.create!(content: "A item")
    get root_path
    assert_match "1 item", response.body
  end
end

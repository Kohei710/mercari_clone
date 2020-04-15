class Item < ActiveRecord::Base

  ### ASSOCIATION
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :transactions, dependent: :destroy

  ###  VALIDATIONS

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  validates :picture, presence: true
  validates :delivery_area, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :days_to_ship, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true


  enum category: {
      レディース:1, メンズ:2, ベビー・キッズ:3,　インテリア・住まい・小物:4,
      本・音楽・ゲーム:5, おもちゃ・ホビー・グッズ:6, コスメ・香水・美容:7, 家電・スマホ・カメラ:8,
      スポーツ・レジャー:9, ハンドメイド:10, チケット:11, 自動車・オートバイ:12, その他:13
  }

  enum delivery_area: {
      "----":0,
      北海道:1, 青森県:2, 岩手県:3, 宮城県:4, 秋田県:5, 山形県:6, 福島県:7,
      茨城県:8, 栃木県:9, 群馬県:10, 埼玉県:11, 千葉県:12, 東京都:13, 神奈川県:14,
      新潟県:15, 富山県:16, 石川県:17, 福井県:18, 山梨県:19, 長野県:20,
      岐阜県:21, 静岡県:22, 愛知県:23, 三重県:24,
      滋賀県:25, 京都府:26, 大阪府:27, 兵庫県:28, 奈良県:29, 和歌山県:30,
      鳥取県:31, 島根県:32, 岡山県:33, 広島県:34, 山口県:35,
      徳島県:36, 香川県:37, 愛媛県:38, 高知県:39,
      福岡県:40, 佐賀県:41, 長崎県:42, 熊本県:43, 大分県:44, 宮崎県:45, 鹿児島県:46,
      沖縄県:47
  }

  enum condition: {
      新品、未使用:1, 未使用に近い:2, 目立った傷や汚れなし:3,　やや傷や汚れあり:4, 傷や汚れあり:5
  }

  enum days_to_ship: {
      "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
  }

  enum shipping_fee: {
      出品者負担:1, 購入者負担:2
  }

  def sold?(item)
    item.transactions.exists?(item_id: item.id)
  end


  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end

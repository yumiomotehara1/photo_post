class Post < ApplicationRecord
  # 投稿したユーザーとの関連付け
  belongs_to :user

  # 投稿画像を登録できるようにする
  has_one_attached :image

  # タイトルのバリデーション
  validates :title, presence: true, length: { maximum: 20 }

  # 投稿内容のバリデーション
  validates :content, length: { maximum: 200 }
end
class User < ApplicationRecord
  # Deviseのログイン機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 1人のユーザーは複数の投稿を持つ
  has_many :posts, dependent: :destroy

  # アイコン画像を登録できるようにする
  has_one_attached :icon

  # 名前のバリデーション
  validates :name, presence: true, length: { maximum: 20 }
end
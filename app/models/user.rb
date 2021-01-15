class User < ApplicationRecord
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :password, with: PASSWORD_REGEX

  validates :first_name_kana, :last_name_kana, presence: true,
                                               format: {
                                                 with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
                                                 message: '全角カタカナのみで入力して下さい'
                                               }

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  validates :nickname,   presence: true
  validates :birth_date, presence: true

  has_many :items,       dependent: :destroy
end

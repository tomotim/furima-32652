class User < ApplicationRecord
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :password, with: PASSWORD_REGEX

  validates :first_name_kana, :last_name_kana, presence: true,
  format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"}
  
  validates :nickname,           presence: true
  validates :first_name,         presence: true
  validates :last_name,          presence: true
  validates :first_name_kana,    presence: true
  validates :last_name_kana,     presence: true
  validates :birth_date,         presence: true
end

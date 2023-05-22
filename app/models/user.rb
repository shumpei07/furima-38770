class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
  validates :last_name, presence: true,format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/u }
  validates :first_name, presence: true,format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/u }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/ }
  validates :birth_date, presence: true
 

end

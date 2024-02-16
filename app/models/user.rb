class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :orders     

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  LAST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of :last_name, with: LAST_NAME_REGEX, message: 'は全角かなで設定してください' 
  FIRST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of :first_name, with: FIRST_NAME_REGEX, message: 'は全角かなで設定してください' 
  LAST_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates_format_of :last_name_kana, with: LAST_NAME_KANA_REGEX, message: 'は全角カナで設定してください' 
  FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX, message: 'は全角カナで設定してください' 
  
end

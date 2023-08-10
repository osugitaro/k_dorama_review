class User < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
  validates :password, format: { with: /\A[a-z\d]{6,}\z/i, message: 'は半角英数字6文字以上で入力してください。' }, on: :create
  validates :password, format: { with: /\A[a-z\d]{6,}\z/i, message: 'は半角英数字6文字以上で入力してください。' }, allow_blank: true, on: :update

  def self.guest
    find_or_create_by!(name: "guest", email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end

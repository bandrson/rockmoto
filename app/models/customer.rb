class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :skip_password_validation

  belongs_to :province

  validates :full_name, presence: true
  validates :email,
            presence:   true,
            uniqueness: true,
            format:     { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
  validates :street_address1, presence: true
  validates :street_address2,
            presence:    true,
            allow_blank: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :province, presence: true

  protected

  def password_required?
    return false if skip_password_validation

    super
  end
end

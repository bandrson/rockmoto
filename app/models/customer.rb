class Customer < ApplicationRecord
  belongs_to :province

  validates :full_name, presence: true
  validates :email,
            presence:   true,
            uniqueness: true,
            format:     { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true
  validates :phone_number, presence: true
  validates :street_address1, presence: true
  validates :street_address2,
            presence:    true,
            allow_blank: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :province, presence: true
end

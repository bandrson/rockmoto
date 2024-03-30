class Order < ApplicationRecord
  belongs_to :customer
  enum :status, [ :new, :paid, :shipped ]
end

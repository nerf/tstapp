class Company < ActiveRecord::Base
  EMAIL = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  PHONE_NUM = /\A[0-9()+ -]+\z/

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :email, format: { with: EMAIL }, if: "self.email?"
  validates :phone, format: { with: PHONE_NUM }, if: "self.phone?"

  has_many :owners
end

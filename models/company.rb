class Company < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i }
  validates :phone, format: { with: /\A[0-9()+ -]+\z/ }

  has_many :owners
end

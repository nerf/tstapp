class Owner < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :company_id }

  belongs_to :company


  mount_uploader :file, ::PassportUploader
end

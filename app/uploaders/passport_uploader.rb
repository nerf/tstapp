require 'carrierwave'

class PassportUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    ['pdf']
  end
end

class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  
  version :standard do
    process :resize_to_fill => [630, 420, :north]
  end
  
  version :thumbnail do
    process :resize_to_fill => [300, 200]
  end     
    
end
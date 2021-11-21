require "image_processing/mini_magick"

class ImageUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      small:  magick.resize_to_limit!(900, 900),
    }
  end
end
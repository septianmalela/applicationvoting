class Post < ApplicationRecord
  include ImageUploader::Attachment(:ketua)
  include ImageUploader::Attachment(:wakil)
end

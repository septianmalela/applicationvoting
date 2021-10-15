class Post < ApplicationRecord
  include ImageUploader::Attachment(:ketua)
  include ImageUploader::Attachment(:wakil)

  acts_as_votable
end

class Band < ApplicationRecord
 mount_uploader :pictureLeft, PictureUploader
 mount_uploader :pictureRight,  PictureUploader
 acts_as_votable
 serialize :photos
 # Note: serialize photos is not necessary,  this is more for displaying an album 
end

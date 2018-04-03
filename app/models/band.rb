class Band < ApplicationRecord
 mount_uploader :pictureLeft, PictureUploader
 mount_uploader :pictureRight,  PictureUploader
 acts_as_votable
 serialize :photos
end

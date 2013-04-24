class Avatar
  include Mongoid::Document
  mount_uploader :upload, AvatarUploader
  belongs_to :user
end
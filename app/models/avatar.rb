class Avatar
  include Mongoid::Document
  mount_uploader :upload, AvatarUploader
  belongs_to :user
  def to_jq_upload
    {
        "name" => read_attribute(:image),
        "size" => upload.size,
        "url" => upload.url,
        "thumbnail_url" => upload.thumb.url,
        "delete_url" => id,
        "upload_id" => id,
        "delete_type" => "DELETE"
    }
  end
end
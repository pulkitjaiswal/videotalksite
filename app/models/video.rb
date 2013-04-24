class Video
  include Mongoid::Document
  field :path, :type => String
  field :status, :type => String, default: 'processing'
  mount_uploader :path, VideoUploader
  process_in_background :path

  def set_success(format, opts)
    set(:status, 'done')
  end
end
class Video
  include Mongoid::Document
  field :path, :type => String
  field :status, :type => String, default: 'processing'
  field :upvote,:type => Integer
  mount_uploader :path, VideoUploader
  process_in_background :path
  embeds_many :comments, :as => :commentable
  def set_success(format, opts)
    set(:status, 'done')
  end

  def create_comment!(params)
    comment = comments.create!(params)
    comment.path = comment.parent ? comments.find(comment.parent).path + '.' + comment.id.to_s : "root."+comment.id.to_s
    comment
  end

  def comments_list(sort=:asc)
    if Comment.respond_to?(sort)
      comments.send(sort,:path)
    else
      raise ArgumentError, "Wrong argument!"
    end
  end

  def branch_for(comment_id)
    comments.select{|i| i.path =~ Regexp.new('^' + comments.find(comment_id).path)}
  end
end
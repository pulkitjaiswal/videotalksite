class Comment
  include Mongoid::Document
  attr_accessible  :path,:parent, :text, :author,:upvote,:created_at,:updated_at
  field :path, :type => String, :default => ""
  field :parent, :type => String
  field :text, :type => String
  field :author, :type => String
  field :upvote,:type => Boolean
  field :created_at, :type => Time
  field :updated_at, :type => Time
  field :user_id, :type => String
  embedded_in :commentable, :polymorphic => true, :inverse_of => :comments

  def level
    path.count('.')
  end

  def remove
    self.update_attribute(:deleted_at, Time.now)
  end

  def restore
    self.update_attribute(:deleted_at, nil)
  end

  def deleted?
    !!self.deleted_at
  end
end

class Friend
  include Mongoid::Document
  field :uid, :type => String
  embeds_many :friend_detail
end

class FriendDetail
  include Mongoid::Document
  field :uid, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :avatar, :type => String
  field :status, :type => Integer
  embedded_in :Friend

  mount_uploader :avatar, AvatarUploader

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
end



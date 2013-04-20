class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates :comtent, :length => {:maximum => 140}
  belongs_to :user
end

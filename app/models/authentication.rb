class Authentication
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :token, :type => String
  field :token_secret, :type => String
  belongs_to :user
end

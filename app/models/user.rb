class User
  include Mongoid::Document

  field :first
  field :last
  field :email
  field :provider
  field :uid
  field :name
  field :avatar
  field :oauth_token
  field :oauth_expires_at, type: DateTime

  def full_name
    if provider
      name
    else
      "#{first} #{last}"
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.avatar = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now+15.days
    end
  end


end
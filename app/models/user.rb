class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_secure_password
  has_many :contributions

  validates_uniqueness_of :email

  field :first
  field :last
  field :email
  field :provider
  field :uid
  field :name
  field :avatar
  field :oauth_token
  field :oauth_expires_at, type: DateTime

  field :password_digest

  def full_name
    if provider
      name
    else
      "#{first} #{last}"
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      pass = SecureRandom.urlsafe_base64
      user.provider               = auth.provider
      user.uid                    = auth.uid
      user.first                  = auth.info.name
      user.last                   = auth.info.name
      user.name                   = auth.info.name
      user.avatar                 = auth.info.image
      user.oauth_token            = auth.credentials.token
      user.oauth_expires_at       = Time.now+15.days
      user.password               = pass
      user.password_confirmation  = pass
    end
  end

end
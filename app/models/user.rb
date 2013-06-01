class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :contributions
  #validates :first, :last, :email, presence: true
  #validates :email, uniqueness: {scope: :provider}
  #before_save :encrypt_password

  field :first
  field :last
  field :email
  field :provider
  field :uid
  field :name
  field :avatar
  field :oauth_token
  field :oauth_expires_at, type: DateTime
  field :password
  field :password_salt
  field :encrypted_password

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

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end


end
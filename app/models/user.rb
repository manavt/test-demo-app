class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: { maximum: 8, minimum: 4 } #,confirmation: true, length: { maximum: 8, minimum: 4 }
  validates :confirm_password, presence: true
  has_one :image , as: :entity
  accepts_nested_attributes_for  :image
  has_many :articles
  # attr_accessor :image
  #class method
  def self.authenticate(email, password)
    return where(email: email, password: Digest::MD5.hexdigest(password)).first
  end

  before_create :encrypt_password
  def encrypt_password
    if not password.nil?
      self.password = Digest::MD5.hexdigest(password)
      self.confirm_password = Digest::MD5.hexdigest(confirm_password)
    end
  end
  after_destroy :save_into_file
  def save_into_file
    File.open("#{Rails.root}/public/#{self.id}.json", "w") { |foo| foo.write(self.to_json)}
  end

  after_validation :verify_passwords
  def verify_passwords
    if password != confirm_password
        errors.add(:base, "password and confirm password are not equal")
    end
  end
  # class PasswordValidator < ActiveModel::EachValidator
  #   def validate_each(record, attribute, value)
  #       record.errors.add attribute, (options[:message] || "password and confirm password are not equal") unless
  #         password == confirm_password
  #       end
  # end
  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.email = auth.info.email
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.profile_image = auth.info.image
      user.save(validate: false)
      return user
    end
  end
end

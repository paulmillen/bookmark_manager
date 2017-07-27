require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,               Serial
  property :email,            String, required: true, unique: true
  property :password_digest,  Text

  validates_format_of :email, :as => :email_address

  def password=(password)
    @password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
  USER_STATUS = ["qualified", "not qualified", "banned"].freeze
  has_many :campaigns, dependent: :destroy
  has_many :todos, dependent: :destroy
  validates :username,:presence => true,:uniqueness => {:case_sensitive => false}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  after_create :novice_user
 
  # default user role is novice if they will singn up
  def novice_user
    if expert?
      self.update(role: "expert")
    elsif
      self.update(role: "novice")
    end
  end 
  
  # Username should be unique.
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
 
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  
  #expert user is like a admin user.
  def expert?
    self.role == "expert"
  end

  # novice user is normal user.
  def novice?
    self.role == "novice"
  end

end

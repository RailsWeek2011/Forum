class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  before_save :set_role, :set_alive
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :freds
  has_many :posts
  
  validates :nick, :presence => true, :uniqueness => true, :allow_blank => false, :length {
            :minimum => 3,
            :maximum => 15,
            :too_short => t(:nick_too_short),
            :too_long => t(:nick_too_long)
          }
  
  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :nick, :signature, :remember_me, :alive, :roles_mask

  ROLES = %w[admin moderator user]

  def roles=(roles)

     self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def role?(base_role)
    roles.include?(base_role.to_s)
  end

  def is?(role)
    roles.include?(role.to_s)
  end
  
  def set_role
    if self.roles.empty?
      self.roles= %w[user]
      #self.save
    end
  end
  
  def set_alive
    if self.alive.nil?
      self.alive = true
    end
  end
  
  def alive?
    self.alive
  end
  
  def deleted?
    !self.alive
  end
  
  def to_s
    self.nick
  end

end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :token_authenticatable)

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me

  validates :nickname, presence: true, uniqueness: true

  before_create :reset_authentication_token

  # CanCan roles ( see Users::Ability)
  ROLES = %w[admin reader]

  def roles=(roles)
    # the role mas is a binary representative of roles, so you can add roles in ROLES but do not change the order
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  # define all bollean set/get methods for roles
  ROLES.each do |r|
    define_method "is_#{r}" do
      self.roles += [r]
      self
    end
    define_method "is_#{r}?" do
      roles.include?(r)
      self
    end
  end

end

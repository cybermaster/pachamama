class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :dining_tables
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable     :registerable,
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role_ids
  
  #def role?(role)
  #    return !!self.roles.find_by_name(role.to_s.camelize)
  #end

  def role?(role_sym)
    roles.any? { |role| role.name.underscore.to_sym == role_sym.downcase }
  end

end

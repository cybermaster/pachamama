class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :dining_tables
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable   :registerable,
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable 
  validates_presence_of :first_name
  

 validates_presence_of   :email 
          validates_uniqueness_of :email, :allow_blank => true, :if => :email_changed?
          validates_format_of     :email, :with  => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :allow_blank => true, :if => :email_changed?

          validates_presence_of     :password
          validates_confirmation_of :password
          validates_length_of       :password, :within => (4..24), :allow_blank => true
          
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name,:last_name,:name, :email, :password, :password_confirmation, :remember_me, :role_ids
  
  #def role?(role)
  #    return !!self.roles.find_by_name(role.to_s.camelize)
  #end
  
  def name= s
    parts = s.split.reverse
    self.first_name = parts.pop
    self.last_name=parts.reverse.join(' ')
  end
    
  

  def role?(role_sym)
    roles.any? { |role| role.name.underscore.to_sym == role_sym.downcase }
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def role_names
    (roles.collect {|e| e.name}).join(',')
  end
end

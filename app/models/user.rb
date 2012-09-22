# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  
  #attr_accessible is EXTREMELY IMPORTANT because without that
  #every attribute of User is by default accessible
  attr_accessible :email, :name, :password_confirmation, :password
  has_secure_password
  before_save { |user| user.email=email.downcase }
  before_save :create_remember_token
  
  validates :name, :presence=>true, :length=> {:maximum=>50}
  # constants are indicated in ruby by a name starting with a capital letter
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence=>true, :format=>{ :with=>VALID_EMAIL_REGEX},
            # :uniqueness=>true
            :uniqueness=>{:case_sensitive=>false}
            
  validates :password, :presence=>true, :length=>{ :minimum=>6}
  validates :password_confirmation, :presence=>true
  
  
  # must be private
  private
    def create_remember_token
      # self is needed in order Active record to understand that it is Active Record attribute and
      # not a local variable.
      self.remember_token=SecureRandom.hex
    end
  
  
            
            
  #Uniqueness of an email in db is enforced in three ways.
  # 1):uniqueness validator in model attribute
  # 2)in the database model with adding an index on email of type unique
  # 3)by using lowercase in the before_save callback, we ensure this way that 
  # lowercase and uppercase are the same, we convert everything to lowercase
  
  
end

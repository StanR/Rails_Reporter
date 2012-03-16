require "digest"

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base

	  validates :login,   :presence => true,
                        :length => { :minimum => 5 },
                        :uniqueness=>true
  	validates :password, :presence => true,
               :presence     => true
    validates_confirmation_of :password
    #validates :password_confirmation, :presence => true
    
  	validates :name,	:presence => true
  	validates :email,	:presence => true,
  						:email => true
    validates :position, :presence => true

    


    def mypassword
      password.to_s
    end
    def mypassword=(pass)
      self.password= Digest::MD5.hexdigest(pass)
    end

    def self.authenticate(login, pass)
      return false if login.nil? or pass.nil?
      find_by_login_and_password(login,pass)
    end

    def self.current
      return false if :current_id.nil?
      self.find_by_login(:current_id)
    end
end

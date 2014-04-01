require 'rubygems'
require 'data_mapper'
DataMapper.setup(:default, 'postgres://nplutzik:@localhost/serveforcommunity_development')

class Service
  include DataMapper::Resource
  has_secure_password
  has n(:users)
  belongs_to(:user)


  property :name,    Serial, :key => true
  property :address,  String, :required => true, :unique => true, :format => /[a-z]/
  property :information, Text, :required => true, :unique => true, :format => /[a-z]/
  property :password_digest,  String, :required => true, :format => /[a-z]/

   def self.authenticate(login, pass)
        u = User.first(:login => login )
        return nil if u.nil?
        return u if u.password == pass
     end
end
DataMapper.finalize
DataMapper.auto_upgrade!

class User
require 'rubygems'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,    Serial, :key => true
  property :name,  String, :required => true, :unique => true, :format => /[a-z]/
  property :email, String, :required => true, :unique => true, :format => /@/
  property :information,  Text, :required => true, :unique => true, :format => /[a-z]/
  property :password_digest,  String, :required => true, :unique => true, :format => /[a-z]/

  property :created_at, DateTime
  property :updated_at, DateTime

    def self.authenticate(login, pass)
        u = User.first(:login => login )
        return nil if u.nil?
        return u if u.password == pass
     end
end

class User
require 'rubygems'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://nplutzik:password@localhost/database')

  include DataMapper::Resource
    equivalence table =>
    has_secure_password
    has_n(:favorites)
    has_n(:services, :through => user_favorites



  property :id,     Serial, :key => true
  property :name,  String, :required => true, :unique => true, :format => /[a-z]/
  property :email,  String, :required => true, :unique => true, :format => /@/
  property :information,  Text, :required => true, :unique => true, :format => /[a-z]/
  property :password_digest,  String, :required => true, :unique => true, :format => /[a-z]/

  property :created_at, DateTime
  property :updated_at, DateTime

  end

    def self.authenticate(login, pass)
        u = User.first(:login => login )
        return nil if u.nil?
        return u if u.password == pass
     end

end


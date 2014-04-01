require 'rubygems'
require 'data_mapper'
DataMapper.setup(:default, 'postgres://nplutzik:@localhost/serveforcommunity_development')

class User
  include DataMapper::Resource

  property :id,    Serial, :key => true
  property :name,  String, :required => true, :unique => true, :format => /[a-z]/
  property :email, String, :required => true, :unique => true, :format => /@/
  property :information,  Text, :required => true
  property :password_digest,  String, :required => true


end

DataMapper.finalize

#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class Person < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure
  
  attr_accessible :activity, :fio, :info, :photo, :role
end

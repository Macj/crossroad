#encoding: UTF-8
require 'date_structure'
require 'file_attache_structure'

class PersonsGroup < ActiveRecord::Base
  include DateStructure
  include FileAttacheStructure
  
  attr_accessible :name, :persons_id, :persons_with_contacts
end

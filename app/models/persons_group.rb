class PersonsGroup < ActiveRecord::Base
  attr_accessible :name, :persons_id, :persons_with_contacts
end

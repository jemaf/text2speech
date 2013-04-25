class Language < ActiveRecord::Base
  attr_accessible :name, :value

  validates_presence_of :name, :value
end

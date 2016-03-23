class Group < ActiveRecord::Base
  has_many :group_combines
  has_many :contacts, through: :group_combines
end

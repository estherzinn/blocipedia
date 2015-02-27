class Collaborator < ActiveRecord::Base
  
  belongs_to :wiki
  belongs_to :user
  accepts_nested_attributes_for :user

  validates :wiki, presence: true
  validates :user, presence: true
  
end
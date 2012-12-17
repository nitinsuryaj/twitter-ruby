class Details < ActiveRecord::Base
  attr_accessible :address, :email, :fname, :uid

  validates :address,  :presence => true
  validates :email, :presence => true
  validates :fname,  :presence => true
  validates :uid, :presence => true

  belongs_to :user
end

class User < ActiveRecord::Base
  attr_accessible :password, :username

  validates :username, :presence => true
  validates :password, :presence => true

  has_one :details
  has_many :twitter_tweet
  has_many :twitter_subscription
end

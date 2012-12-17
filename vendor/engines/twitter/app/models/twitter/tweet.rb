module Twitter
  class Tweet < ActiveRecord::Base
    attr_accessible :tweet, :uid

    validates :tweet,  :presence => true

    belongs_to :user
  end
end

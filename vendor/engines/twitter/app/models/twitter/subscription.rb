module Twitter
  class Subscription < ActiveRecord::Base
    attr_accessible :suid, :uid

    belongs_to :user
  end
end

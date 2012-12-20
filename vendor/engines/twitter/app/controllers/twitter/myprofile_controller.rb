require_dependency "twitter/application_controller"

module Twitter
  class MyprofileController < ApplicationController
    def index
    	@user=User.where("id=#{session['uid']}").find(:first)
    	@detail=Details.where("uid=#{session['uid']}").find(:first)
    end

    def delete
        #deleting all the  user details
    	User.where("id=#{params['uid']}").find(:first).destroy()
    	Details.where("uid=#{session['uid']}").find(:first).destroy()
    	@p=Tweet.where(:uid=>params['uid'])
    	@p.each do |c|
    		c.destroy
    	end
    	@s=Subscription.where(:uid=>params['uid'])
        #deleting all subscriptions of user
    	@s.each do |c|
    		c.destroy()
    	end

        @s=Subscription.where(:suid=>params['uid'])
        #deleting details of people subscribed to user
        @s.each do |c|
            c.destroy()
        end
    	session['uid']=nil
    	redirect_to "/"
    end
  end
end

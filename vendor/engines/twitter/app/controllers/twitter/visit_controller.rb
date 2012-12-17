require_dependency "twitter/application_controller"

module Twitter
  class VisitController < ApplicationController
    def index
    	suid=params[:id]
      uname=User.select('username').where("id=#{suid}").find(:first)
      @u=uname.username
      x=Subscription.where("uid=#{session['uid']} and suid=#{suid}").find(:first)
      if x === nil
  		  @following=0
      else
  		  @following=1
      end

  	   @posts=Tweet.select('tweet,created_at').where("uid=#{suid}").order("created_at DESC")
    end

    def follow
  		fuid=params[:id]
  		Subscription.create(:uid => session['uid'], :suid => fuid)
  		redirect_to :action => "index", :id=>fuid
  	end

  	def unfollow
  		fuid=params[:id]
  		@following=0
  		Subscription.where("uid = #{session['uid']} and suid = #{fuid}").find(:first).destroy
  		redirect_to :action => "index", :id=>fuid
  	end

  end
end

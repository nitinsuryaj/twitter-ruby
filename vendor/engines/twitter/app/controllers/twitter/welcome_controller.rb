require_dependency "twitter/application_controller"

module Twitter
  class WelcomeController < ApplicationController
    def index
   	if session['uid']==nil
  		redirect_to :action => "index"
  	else
  	subid=[]
  	i=0
  	@b=Subscription.select('suid').where("uid=#{session['uid']}")
  	@b.each do |e|
  		subid[i]=e.suid
  		i=i+1
  	end
  	subid[i]=session['uid']
    
    @i=0
    @subidu=[]
    subid.each do |x|
      @user=User.select('username').where("id=#{x}").find(:first)
      @u=@user.username
      t = []
      t[0]=x
      t[1]=@u
      @subidu[@i]=t
      @i=@i+1
    end

  	@posts=Tweet.select('id,uid,tweet,created_at').where(:uid=>subid).order("created_at DESC")
  	end
    end

    def logout
    	session['uid']=nil
    end

    def tweet
    	@p=Tweet.create(:uid=>session['uid'],:tweet=>params[:tweet])
      if @p.errors.messages.any?
        redirect_to :controller=>"welcome", :tweetcheck => "1"
      else
  		  redirect_to :controller=>"welcome"
      end
    end

    def search
      if params[:search]==''
        redirect_to :controller=>"welcome", :searchcheck => "1"
      end
    	@requser=User.select('id,username').where("username LIKE '%#{params[:search]}%'")
    end

    def delete
      Tweet.where(:id=>params["pid"]).first().destroy()
      redirect_to :controller => "welcome"
    end

    def retweet
      @pre=Tweet.select('tweet').where(:id=>params["pid"]).first().destroy()
      @pr=Tweet.create(:uid=>session['uid'],:tweet=>@pre.tweet)
      if @pr.errors.messages.any?
        redirect_to :controller=>"welcome", :tweetcheck => "1"
      else
        redirect_to :controller=>"welcome"
      end
    end
  end
end

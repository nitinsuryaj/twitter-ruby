class IntroController < ApplicationController
  def index
  	if session['uid'] != nil
      #when session active redirecting to welcome page
      redirect_to :controller=>"intro", :action=>"welcome"
    end
  end

  def verify
    #paramscheck is used as an indicator for incorrect username or password combination 
    if params[:name]=='' || params[:pass]==''
      redirect_to :action=>"index", :paramscheck => "1"
    else
    	@user=User.where("username='"+params[:name]+"'").find(:first)
    	if @user.nil?
    		redirect_to :action=>"index", :paramscheck => "1"
    	else
    		if @user.password==params[:pass]
    			session['uid']=@user.id
    			redirect_to :action=>"welcome"
    		else
    			redirect_to :action=>"index", :paramscheck => "1"
    		end
    	end
    end
  end

  def logout
    #to logout
  	session['uid']=nil
  	redirect_to :action=>"index"
  end

  def welcome
    if session['uid'].nil? #if session not active redirect to login
      redirect_to :controller=>"intro", :action=>"index"
    else
    	x=session['uid']
    	@user=User.where("id=#{x}").first();
    end
  end
end

class IntroController < ApplicationController
  def index
  	if session['uid'] != nil
      redirect_to :controller=>"intro", :action=>"welcome"
    end
  end

  def verify
    if params[:name]=='' || params[:pass]==''
      redirect_to :action=>"index", :paramscheck => "1"
    else
  	@user=User.where("username='"+params[:name]+"'").find(:first)
  	if @user==nil then
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
  	session['uid']=nil
  	redirect_to :action=>"index"
  end

  def welcome
  	x=session['uid']
  	@user=User.where("id=#{x}").first();
  end
end

class SignupController < ApplicationController
  def index
  	if session['uid'] != nil
      redirect_to :controller=>"intro", :action=>"welcome"
    end
  end

  def save
	if params[:fname]==''||params[:uname]==''||params[:email]=''||params[:pass]==''
		redirect_to :controller => "signup", :action=>"index", :paramscheck => "1"
	else
	@u=User.create(:username=>params[:uname],:password=>params[:pass])
	Details.create(:fname=>params[:fname],:email=>params[:email],:address=>params[:addr],:uid=>@u.id)
	redirect_to :controller => "intro", :action=>"index"
	end
  end
end
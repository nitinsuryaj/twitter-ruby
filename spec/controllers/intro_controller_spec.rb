require 'spec_helper'

describe IntroController do
	describe "session" do
		before :each do
			session['uid']=1;
		end

		describe "intro#index" do
			it "when session is present redirect to welcome" do
				post :index
				response.should redirect_to :controller => "intro", :action => "welcome"
			end
		end

		describe "intro#verify" do
			it "checks redirection of verify when incorrect username and pass given" do
				post :verify, :name => "nitin", :pass => "nn"
				response.should redirect_to :controller => "intro", :action => "index", :paramscheck => '1'
			end

			it "checks redirection of verify when correct username and pass given" do
				post :verify, :name => 'nitin', :pass => 'nitin'
				response.should redirect_to :controller => "intro", :action => "welcome"
			end
		end

		describe "intro#logout" do
			it "logging out" do
				post :logout
				response.should redirect_to :controller => "intro", :action => "index"
			end
		end
	end
end
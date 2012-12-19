require 'spec_helper'

describe IntroController do
	describe "intro#index" do
		it "checks redirection" do
			session[:uid] = "1"
			response.should redirect_to("welcome")
		end
	end
end
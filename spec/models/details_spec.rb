require 'spec_helper'

describe Details do
	it "has valid factory" do
		FactoryGirl.create(:details).should be_valid
	end
	it "is invalid without a fname" do
		FactoryGirl.build(:details, fname: nil).should_not be_valid
	end
	it "is invalid without a email" do
		FactoryGirl.build(:details, email: nil).should_not be_valid
	end
	it "is invalid without a address" do
		FactoryGirl.build(:details, address: nil).should_not be_valid
	end
	it "is invalid without a uid" do
		FactoryGirl.build(:details, uid: nil).should_not be_valid
	end
end
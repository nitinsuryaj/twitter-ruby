require 'faker'

FactoryGirl.define do
  factory :details do |f|
  	f.fname "ni"
  	f.email "x"
  	f.address "y"
  	f.uid 1
  end
end
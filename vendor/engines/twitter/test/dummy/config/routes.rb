Rails.application.routes.draw do

  mount Twitter::Engine => "/twitter"
end

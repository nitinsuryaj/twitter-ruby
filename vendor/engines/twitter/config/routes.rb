Twitter::Engine.routes.draw do

	root :to => "welcome#index"
	match "welcome/tweet" => "welcome#tweet"
	match "myprofile/index" => "myprofile#index"
	match "myprofile/delete" => "myprofile#delete"
	match "welcome/retweet" => "welcome#retweet"
	match "welcome/delete" => "welcome#delete"
	match "welcome/search" => "welcome#search"
	match "visit/index" => "visit#index"
	match "visit/follow" => "visit#follow"
	match "visit/unfollow" => "visit#unfollow"
end

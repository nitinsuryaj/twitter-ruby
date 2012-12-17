Twitter::Engine.routes.draw do

	root :to => "welcome#index"
	match "welcome/tweet" => "welcome#tweet"
	match "welcome/search" => "welcome#search"
	match "visit/index" => "visit#index"
	match "visit/follow" => "visit#follow"
	match "visit/unfollow" => "visit#unfollow"
end

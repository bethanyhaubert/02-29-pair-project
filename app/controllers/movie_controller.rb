MyApp.get "/" do
	@random_movie = "http://techno2013.ucoz.com/dhoom2-18-1.jpg"
	erb :"movies/home"
end

MyApp.post "/movies/search" do
end

MyApp.get "/movies/search/results" do
end

MyApp.get "/movies/new" do
	erb :'movies/new'
end

MyApp.post "/movies/create" do
	@movie = Movie.new
	@movie.title = params[:title]
	@movie.director = params[:director]
	@movie.image = params[:image]
	@movie.critic_rating = params[:rating]

	if @movie.is_valid == true
	 	@movie.save
		redirect "/movies/#{@movie.id}/view"
	else
		@error_object = @movie
		erb :"error"
	end
end

MyApp.get "/movies/:id/view" do
	erb :"movies/view"
end

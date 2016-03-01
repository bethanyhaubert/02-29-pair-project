MyApp.get "/results/list" do
	@bechdel_pass = Result.passing
  erb :"results/gallery"
end

MyApp.post "/results/:id/add" do
	@current_movie = Movie.find_by_id(params[:id])
	@result = Result.new
	@result.q1 = params[:q1]
	@result.q2 = params[:q2]
	@result.q3 = params[:q3]
	@result.movie_id = @current_movie.id
	@result.user_id = @current_user.id
	@result.save
  redirect "/movies/#{@movie.id}/view"
end

MyApp.get "/results/:id/edit" do
end

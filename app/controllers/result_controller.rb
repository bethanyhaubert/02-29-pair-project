MyApp.get "/results/list" do
	@bechdel_pass = Result.passing
  erb :"results/gallery"
end

MyApp.post "/results/:id/add" do
	@movie = Movie.find_by_id(params[:id])
	@result = Result.new
	@result.q1 = params[:q1]
	@result.q2 = params[:q2]
	@result.q3 = params[:q3]
	@result.movie_id = @current_movie.id
	@result.user_id = @current_user.id
	if @result.is_valid == true
	 	@result.save
		redirect "/movies/#{@movie.id}/view"
	else
		@error_object = @result
		erb :"error"
	end
end

MyApp.post "/results/:id/edit" do
	@movie = Movie.find_by_id(params[:id])
	@result =  Result.where({"movie_id" => @movie.id }).first
	@result.q1 = params[:q1]
	@result.q2 = params[:q2]
	@result.q3 = params[:q3]
	@result.user_id = @current_user.id
	if @result.is_valid == true
	 	@result.save
		redirect "/movies/#{@movie.id}/view"
	else
		@error_object = @result
		erb :"error"
	end
end

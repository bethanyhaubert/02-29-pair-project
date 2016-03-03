MyApp.get "/results/list" do
  @bechdel_pass = Result.passing
  erb :"results/gallery"
end

MyApp.post "/results/:id/add" do
  session["temporary_error_message"] = nil
  @movie = Movie.find_by_id(params[:id])
  @result = Result.new
  @result.q1 = params[:q1]
  @result.q2 = params[:q2]
  @result.q3 = params[:q3]
  @result.movie_id = @movie.id
  if @current_user != nil
    @result.user_id = @current_user.id
  else 
    session["temporary_error_message"] = ["Please login first"]
    redirect "/movies/#{@movie.id}/view"
  end

  if @result.is_valid == true
    @result.save
    redirect "/movies/#{@movie.id}/view"
  else
    @error_object = @result
    redirect "/movies/#{@movie.id}/view"
  end
end

MyApp.post "/results/:id/edit" do
  @movie = Movie.find_by_id(params[:id])
  @result = Result.where({"movie_id" => @movie.id }).first
  @result.set_qs_to_nil
  @result.q1 = params[:q1]
  @result.q2 = params[:q2]
  @result.q3 = params[:q3]
  @result.movie_id = @movie.id
  @result.user_id = @current_user.id
  if @result.is_valid == true
    @result.save
    redirect "/movies/#{@movie.id}/view"
  else
    @error_object = @result
    redirect "/movies/#{@movie.id}/view"
  end
end

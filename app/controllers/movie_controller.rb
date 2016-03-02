MyApp.before "/*" do
  @current_user = User.find_by_id(session["user_id"])
end

MyApp.get "/" do
  @random_movie = Result.order("RANDOM()").first
  erb :"movies/home"
end

MyApp.post "/movies/search" do
  @movie_search = params[:search].gsub(/\s+/,"_")
  if params[:passes_bechdel] == nil
    @bechdel_pass = 2
  else
    @bechdel_pass = params[:passes_bechdel]
  end

  if params[:search_category] !=nil
    @category = params[:search_category]
    redirect "/movies/#{@movie_search}/#{@category}/#{@bechdel_pass}/results"
  else
    @error_object = "Please select a category"
    redirect "/"
  end
end

MyApp.get "/movies/:search/:category/:bechdel/results" do
  @bechdel = params[:bechdel]
  if params[:category] == "title"
    @list_of_movies = Movie.movie_search_title(params[:search].gsub(/_+/," "))
  else
    @list_of_movies = Movie.movie_search_director(params[:search].gsub(/_+/," "))
  end
  erb :"movies/search_results"
end

MyApp.get "/movies/new" do
  erb :'movies/new'
end

MyApp.post "/movies/create" do
  @movie = Movie.new
  @movie.title = params[:title].capitalize
  @movie.director = params[:director].capitalize
  @movie.image = params[:image]
  @movie.critic_rating = params[:rating]
  @movie.save
  redirect "/movies/#{@movie.id}/view"
end

MyApp.get "/movies/:id/view" do
  @movie = Movie.find_by_id(params[:id])
  erb :"movies/view"
end

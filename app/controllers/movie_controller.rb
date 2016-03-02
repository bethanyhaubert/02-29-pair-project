MyApp.before "/*" do
  @current_user = User.find_by_id(session["user_id"])
end

MyApp.get "/" do
  @random_movie = "http://techno2013.ucoz.com/dhoom2-18-1.jpg"
  erb :"movies/home"
end

MyApp.post "/movies/search" do
  @movie_search = params[:search]
  redirect "/movies/#{@movie_search}/results"
end

MyApp.get "/movies/:search/results" do
  @list_of_movies = Movie.movie_search(params[:search])
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

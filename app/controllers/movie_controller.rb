MyApp.before "/*" do
  @current_user = User.find_by_id(session["user_id"])
    if session["temporary_error_message"] != nil
    @error = session["temporary_error_message"] 
  end
end

MyApp.get "/" do
  @random_movie = Movie.top_movies_array.sample
  @movie_details = HTTParty.get("http://www.omdbapi.com/?t=#{@random_movie}&y=&plot=short&r=json")
  if Movie.find_by({"title" => @random_movie}) != nil
    @new_movie = Movie.find_by({"title" => @random_movie})
  else
  @new_movie = Movie.new
  @new_movie.title = @movie_details["Title"]
  @new_movie.director = @movie_details["Director"]
  @new_movie.image = @movie_details["Poster"]
  @new_movie.save
  end
  erb :"movies/home"
end

MyApp.post "/movies/search" do
  session["temporary_error_message"] = nil

  formatted_search = Search.format(params[:search])

  @movie_search = formatted_search.gsub(/\s+/, "_") 

  if params[:passes_bechdel] == nil
    @bechdel_pass = 2
  else
    @bechdel_pass = params[:passes_bechdel]
  end

  if params[:search_category] != nil
    @category = params[:search_category]

    if params[:search_category] == "title" && Movie.find_by({"title" => formatted_search}) == nil
        session["temporary_error_message"] = ["Invalid movie title"]
        redirect "/"
    elsif params[:search_category] == "director" && Movie.find_by({"director" => formatted_search}) == nil
        session["temporary_error_message"] = ["Invalid director name"]
        redirect "/"
    else
      redirect "/movies/#{@movie_search}/#{@category}/#{@bechdel_pass}/results"
    end

  else
    session["temporary_error_message"] = ["Please select a category"]
    redirect "/"
  end
end

MyApp.get "/movies/:search/:category/:bechdel/results" do
  @bechdel = params[:bechdel]
  if params[:category] == "title"
    @list_of_movies = Movie.movie_search_title(params[:search].gsub(/_+/, " "))
   else
    @list_of_movies = Movie.movie_search_director(params[:search].gsub(/_+/, " "))
  end
  erb :"movies/search_results"
end

# MyApp.get "/movies/new" do
#   erb :'movies/new'
# end

# MyApp.post "/movies/create" do
#   @movie = Movie.new
#   @movie.title = params[:title].capitalize
#   @movie.director = params[:director].capitalize
#   @movie.image = params[:image]
#   @movie.critic_rating = params[:rating]
#   @movie.save
#   redirect "/movies/#{@movie.id}/view"
# end

MyApp.get "/movies/:id/view" do
  @movie = Movie.find_by_id(params[:id])
  erb :"movies/view"
end
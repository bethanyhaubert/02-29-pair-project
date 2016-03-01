MyApp.get "/" do
	@random_movie = "http://techno2013.ucoz.com/dhoom2-18-1.jpg"
	erb :"movies/home"
end

MyApp.post "/movies/search" do
end

MyApp.get "/movies/search/results" do
end

MyApp.get "/movies/new" do
end

MyApp.post "/movies/create" do
end

MyApp.get "/movies/:id/view" do
end

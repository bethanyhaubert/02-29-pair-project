MyApp.get "/results/list" do
	@bechdel_pass = Result.passing
  erb :"results/gallery"
end

MyApp.post "/results/:id/new" do
end

MyApp.get "/results/:id/edit" do
end

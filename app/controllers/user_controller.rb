MyApp.before "/users/:user_id/*" do
	@current_user = User.find_by_id(session["user_id"])
	@user = User.find(params[:user_id])
  	if @current_user == nil
  		session["temporary_error_message"] = "You must login first"  
  	redirect "/"
	end
end

MyApp.get "users/new" do
	erb :"users/new"
end

MyApp.post "users/create" do
	@user = User.new
	@user.name = params[:name]
	@user.email = params[:email]
	@user.password = params[:password]

	if @user.is_valid == true
	 	@user.save
		redirect "users/#{@user.id}/view"
	else
		@error_object = @user
		erb :"error"
	end
end

MyApp.get "users/:id/view" do
   erb :"users/view"
end

MyApp.post "users/:id/edit" do
	if @user == @current_user
		@user.assign_attributes({name: params['name'], email: params['email'], password: params['password']})
		if @user.is_valid == true
			@user.save
			redirect "users/#{@user.id}/view"
		else
			@error_object = @user
			erb :"error"
		end
	else
	erb :"logins/denied_access"
	end
end

MyApp.post "users/:id/delete" do
	if @user == @current_user
		@user.delete
  		erb :"success"
  	else
  		erb :"logins/denied_access"
	end
end

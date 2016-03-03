MyApp.before "/users/:id/*" do
  @current_user = User.find_by_id(session["user_id"])
  @user = User.find(params[:id])
  if @current_user == nil
    session["temporary_error_message"] = "You must login first"
    redirect "/"
  end
end

MyApp.get "/users/new" do
  erb :"users/new"
end

MyApp.post "/users/create" do
  session["temporary_error_message"] = nil
  @user = User.new
  @user.name = params[:name]
  @user.email = params[:email]
  @user.password = params[:password]

  if @user.is_valid == true
    @user.save
    redirect "/users/#{@user.id}/view"
  elsif @user.is_valid == false
    session["temporary_error_message"] = @user.get_errors
    @error_object = session["temporary_error_message"]
    redirect "/"
  end
end

MyApp.get "/users/:id/view" do
  @user = User.find(params[:id])
  erb :"users/view"
end

MyApp.post "/users/:id/edit" do
  session["temporary_error_message"] = nil
  if @user == @current_user
    @user.assign_attributes({name: params['name'], email: params['email'], password: params['password']})
    if @user.is_valid == true
      @user.save
      redirect "/users/#{@user.id}/view"
    else
      @error_object = @user
      redirect "/users/#{@user.id}/view"
    end
  end
end

MyApp.post "/users/:id/delete" do
  if @user == @current_user
    @user.delete
    redirect "/"
  end
end

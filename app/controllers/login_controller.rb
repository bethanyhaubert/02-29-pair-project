MyApp.post "/login" do

  session["temporary_error_message"] = nil

  @authentication = Authentication.new(params["email"], params["password"])

    if @authentication.is_valid == true
      session["user_id"] = @authentication.user_object.id
    else 
      session["temporary_error_message"] = @authentication.get_errors
  end
    redirect "/"
end

MyApp.get "/logout" do
  session["user_id"] = nil
  redirect "/"
end
MyApp.post "/login" do
  session["temporary_error_message"] = nil
  
  if params["email"] == ""
    session["temporary_error_message"] = ["Incorrect login information"]

  elsif User.find_by_email(params["email"]) == nil
    session["temporary_error_message"] = ["User with this email does not exist"]

  elsif User.find_by_email(params["email"]) != nil
    @user = User.find_by_email(params["email"])
   
    if params["password"] != ""
      if @user.password == params["password"]
        session["user_id"] = @user.id
        session["temporary_error_message"] = nil
      else
        session["temporary_error_message"] = ["Incorrect login information"]
      end

    elsif params["password"] == ""
      session["temporary_error_message"] = ["Please input password"]
    end
  end
    redirect "/"
end

MyApp.get "/logout" do
  session["user_id"] = nil
  redirect "/"
end
MyApp.post "/login" do
	@user = User.find_by_email(params["email"])

	  if params["password"] != nil
	    if @user.password == params["password"]
	      session["user_id"] = @user.id
	      session["temporary_error_message"] = nil
	      redirect "/"
	    else
	      session["temporary_error_message"] = "Incorrect login information"
	     redirect "/"
	    end
	  else
	      session["temporary_error_message"] = "Please create a new account"
	     redirect "/"
	  end
end

MyApp.post "/logout" do
 	session["user_id"] = nil
  redirect "/"
end
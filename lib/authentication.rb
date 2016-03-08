# Utility method for logins

#Authentication class for login controller
class Authentication

 # initializes new Authentication object
 #
 # Returns nil
	def initialize(email, password)
	 @email = email
	 @password = password
	end

 # Checks to see if either of the form inputs were left blank
 #
 # Returns Boolean
	def params_empty?
		@email == "" || @password == ""
	end

 # Checks to see if User object exists with this email
 #
 # Returns Boolean
	def user_exists?
    	# User.find_by_email(@email) != nil
    	user_object != nil
  	end

 #Returns current User object
	def user_object
		User.find_by_email(@email)
	end


 # Adds errors to Array
 #
 # Returns Array
	def set_errors
		@errors = []
		if self.params_empty? == true
			@errors << "Please fill out the login form completely before submitting"
	
		elsif self.user_exists? != true
			@errors << "User with this email does not exist"

		elsif user_object.password != @password
			@errors << "Incorrect password"
    	end
	end


 # Returns @errors
	def get_errors
    	return @errors
 	end


 # Checks if the record is valid.
 # 
 # Returns Boolean.
	def is_valid
	  	self.set_errors
	  	if @errors.length > 0
	    	return false
	  	else
	    	return true
	  	end
	end

end
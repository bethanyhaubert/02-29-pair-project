class User < ActiveRecord::Base

	#Returns @errors
	def get_errors
    	return @errors
 	end

  	#Adds errors to Hash
  	#
  	#Returns Hash
  	def set_errors
    	@errors = []

    	if self.name == ""
      	@errors << "Name cannot be blank"
    	end

    	if self.email == ""
      	@errors << "Email cannot be blank"
    	end

      if User.exists?(email: [self.email]) == true
        @errors << "An account already exists for this email address."
      end

    	if self.password == ""
      	@errors << "Must choose a password"
    	end
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
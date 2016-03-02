class Result < ActiveRecord::Base
  def set_qs_to_nil
    self.q1 = nil
    self.q2 = nil
    self.q3 = nil
  end

	def Result.passing
		results = Result.where({"q1" => true, "q2" => true, "q3" => true})
		if results.empty?
			return nil
		else
			return results
		end
	end

	def get_id
		return Movie.find_by_id(self.movie_id)
	end

	def get_image
		movie = self.get_id
		return movie.image
	end

  def get_title
    movie = self.get_id
    return movie.title
  end

 # Returns @errors
	def get_errors
    return @errors
 	end

 # Adds errors to Hash
 #
 # Returns Hash
	def set_errors
  	@errors = []
    if self.user_id == nil
    	@errors << "Must be logged in to add or edit the Bechdel rating."
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
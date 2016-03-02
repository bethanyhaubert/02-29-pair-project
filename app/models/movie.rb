class Movie < ActiveRecord::Base

	#Takes a search parameter and returns a list of 
	#movies that match that parameter.
	#
	#Search text - this parameter is the text pulled from the search bar.
	#
	#Returns list of movie objects.
	def Movie.movie_search_title(search_text)
	 	movie_match = Movie.where({"title" => search_text.capitalize})
		if movie_match.empty?
        	return nil
    	else
      		return movie_match
    	end
	end

	#Takes a search parameter and returns a list of 
	#movies that match that parameter.
	#
	#Search text - this parameter is the text pulled from the search bar.
	#
	#Returns list of movie objects.
	def Movie.movie_search_director(search_text)
	 	movie_match = Movie.where({"director" => search_text.capitalize})
		if movie_match.empty?
        	return nil
    	else
      		return movie_match
    	end
	end

	def bechdel_result
		movie_result = Result.where({"movie_id" => self.id}).first
		if movie_result == nil
			return nil
		elsif movie_result.q1 == true && movie_result.q2 == true && movie_result.q3 == true
			return true
		else
			return false
		end
	end

end
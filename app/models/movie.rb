class Movie < ActiveRecord::Base

	#Takes a search parameter and returns a list of 
	#movies that match that parameter.
	#
	#Search text - this parameter is the text pulled from the search bar.
	#
	#Returns list of movie objects.
	def Movie.movie_search(search_text)
	 	movie_match = Movie.where({"title" => search_text.capitalize})
		if movie_match.empty?
        	return nil
    	else
      		return movie_match
    	end
	end



end
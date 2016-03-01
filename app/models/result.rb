class Result < ActiveRecord::Base

	def Result.passing
		results = Result.where({"q1" => true, "q2" => true, "q3" => true})
		if results.empty?
			return nil
		else 
			return results
		end
	end

	def get_id
		Movie.find_by_id(self.movie_id)
	end

	def get_image
		movie = self.get_id
		return movie.image
	end

end
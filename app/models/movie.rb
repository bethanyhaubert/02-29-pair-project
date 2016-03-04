# DB.define_column("movies", "title", "string")
# DB.define_column("movies", "director", "string")
# DB.define_column("movies", "image", "string")
# DB.define_column("movies", "critic_rating", "integer")
class Movie < ActiveRecord::Base
 # Takes a search parameter based on title and returns a list of
 # Movie objects that match that parameter.
 #
 # Search text - this parameter is the String pulled from the search bar.
 #
 # Returns list of Movie objects
   def Movie.movie_search_title(search_text)
   	movie_match = Movie.where({"title" => search_text.capitalize})
   	if movie_match.empty?
      return nil
   	else
      return movie_match
   	end
   end

 # Takes a search parameter based on director and returns a list of
 # Movie objects that match that parameter.
 #
 # Search text - this parameter is the String pulled from the search bar.
 #
 # Returns list of Movie objects.
 	def Movie.movie_search_director(search_text)
	 	movie_match = Movie.where({"director" => search_text.capitalize})
	 	if movie_match.empty?
	 		return nil
	 	else
	 		return movie_match
	 	end
	end

 # Checks to see if a Movie object passes the bechdel test
 #
 # Returns Boolean
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

	def self.top_movies_array
		movies = Array.[](
			"Mughal-e-Azam", 
			"Pyaasa",
			"Guide",
			"Deewaar",
			"Lagaan",
			"Pakeezah",
			"Do Bigha Zamin",
			"3 Idiots",
			"Kaagaz Ke Phool",
			"Bombay",
			"Mr India",
			"Dil Chahta Hai",
			"Andaz Apna Apna",
			"Awaara",
			"Dil To Pagal Hai",
			"Om Shanti Om",
			"Jab We Met",
			"Parinda",
			"Shaan",
			"Zindagi Na Milegi Dobara",
			"Silsila",
			"Anand",
			"Barfi!",
			"Ankur",
			"Ek Tha Tiger",
			"Kaala Patthar",
			"Ghajini",
			"Jodhaa Akbar",
			"The Lunchbox",
			"Khakee",
			"Maine Pyar Kiya",
			"Parvarish",
			"Kuch Kuch Hota Hai",
			"Mera Naam Joker",
			"Queen",
			"Rockstar",
			"Sangam",
			"Tezaab",
			"Sahib Bibi Aur Ghulam",
			"Tashan",
			"Satyam Shivam Sundaram",
			"Aiyyaa",
			"Lootera",
			"Parineeta",
			"Bunty Aur Babli",
			"Jagte Raho",
			"Chandni",
			"Madhumati",
			"Gunga Jumna",
			"Jewel Thief",
			"Chhoti Si Baat",
			"Omkara",
			"Zanjeer",
			"Naseeb",
			"Teesri Kasam",
			"Zubeidaa",
			"Udaan",
			"Bandit Queen",
			"Gangster",
			"Black",
			"Dabangg",
			"Kahaani",
			"Dhoom",
			"Arth",
			"Black Friday",
			"Kati Patang",
			"Hera Pheri",
			"Lage Raho Munna Bhai",
			"Mujhse Dosti Karoge!",
			"Salaam Bombay!",
			"Swades",
			"Umrao Jaan",
			"Veer-Zaara",
			"Bobby")
	end
end
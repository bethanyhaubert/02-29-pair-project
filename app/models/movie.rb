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
		movies = Array.[]("Sholay",
			"Mughal-e-Azam", 
			"Mother India",
			"Dilwale Dulhania Le Jayenee",
			"Pyaasa",
			"Guide",
			"Deewaar",
			"Lagaan",
			"Pakeezah",
			"Amar Akbar Anthony",
			"Do Bigha Zamin",
			"Jaane Bhi Do Yaaro",
			"3 Idiots",
			"Kaagaz Ke Phool",
			"Bombay",
			"Mr India",
			"Satya",
			"Dil Chahta Hai",
			"Andaz Apna Apna",
			"Awaara",
			"Dil To Pagal Hai",
			"Om Shanti Om",
			"Shree 420",
			"Jab We Met",
			"Parinda",
			"Shaan",
			"Zindagi Na Milegi Dobara",
			"Silsila",
			"Anand",
			"Prem Rog",
			"Barfi!",
			"GolMaal",
			"Ankur",
			"Ek Tha Tiger",
			"Chak De! India",
			"Kaala Patthar",
			"Ghajini",
			"Jodhaa Akbar",
			"Kabhi Khushi Kabhie Gham",
			"Dil Se",
			"The Lunchbox",
			"Khakee",
			"Maine Pyar Kiya",
			"Parvarish",
			"Velu Nayakan",
			"Kuch Kuch Hota Hai",
			"Mera Naam Joker",
			"Queen",
			"Main Hoon Na",
			"Rockstar",
			"Sangam",
			"Tezaab",
			"Sahib Bibi Aur Ghulam",
			"Tashan",
			"Satyam Shivam Sundaram",
			"Aiyyaa",
			"Garam Hawa",
			"Hum Hain Rahi Pya Ke",
			"Lootera",
			"Parineeta",
			"Sharmeelee",
			"Bunty Aur Babli",
			"Jagte Raho",
			"Chandni",
			"Madhumati",
			"Gunga Jumna",
			"Devdas",
			"Jewel Thief",
			"Chhoti Si Baat",
			"Omkara",
			"Zanjeer",
			"Naseeb",
			"Teesri Kasam",
			"Zubeidaa",
			"Udaan",
			"Kabhie Kabhie",
			"Bandit Queen",
			"Gangster",
			"Black",
			"Dabangg",
			"Kahaani",
			"Dhoom",
			"Arth",
			"Gangs of Wasseypur: Part One",
			"Black Friday",
			"Kati Patang",
			"Dhobi Ghat",
			"Bhaag Milkha Bhaag",
			"Hera Pheri",
			"Ardh Satya",
			"Lage Raho Munna Bhai",
			"Mujhse Dosti Karoge!",
			"Salaam Bombay!",
			"Swades",
			"Umrao Jaan",
			"Veer-Zaara",
			"Yeh Jawaani Hai Deewani",
			"Bobby")
	end
end
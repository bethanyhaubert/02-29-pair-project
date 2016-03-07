# Utility method for proper casing of a search query/

module Search

  def Search.format(search_string) #this feels way too weird
    array = search_string.split(" ")

    new_array = []

    array.each do |word|
      new_array << word.capitalize
    end

    new_array.join(" ")
    
  end

end
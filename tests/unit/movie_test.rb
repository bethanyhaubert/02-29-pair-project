require 'test_helper'

class MovieTest < Minitest::Test
  def setup
    super
    @movie1 = Movie.new
    @movie1.title = "Barfi"
    @movie1.director = "Some dude"
    @movie1.critic_rating = "100"
    @movie1.save

    @movie2 = Movie.new
    @movie2.title = "Hello Beth"
    @movie2.director = "Some lady"
    @movie2.critic_rating = "100"
    @movie2.save

    @movie3 = Movie.new
    @movie3.title = "Hello Class"
    @movie3.director = "Some dude"
    @movie3.critic_rating = "50"
    @movie3.save

    @result1 = Result.new
    @result1.movie_id = @movie1.id
    @result1.q1 = true
    @result1.q2 = true
    @result1.q3 = true
    @result1.save

    @result2 = Result.new
    @result2.movie_id = @movie2.id
    @result2.q1 = false
    @result2.q2 = true
    @result2.q3 = true
    @result2.save
  end

  def test_movie_search_title
 	  assert_includes(Movie.movie_search_title("Barfi"), @movie1)
 	  refute_includes(Movie.movie_search_title("Barfi"), @movie2)
  end

  def test_movie_search_title_nil
 	  assert_nil(Movie.movie_search_title("hi derek"))
  end

  def test_movie_search_director
    assert_includes(Movie.movie_search_director("Some dude"), @movie1)
    refute_includes(Movie.movie_search_director("Some dude"), @movie2)
  end

  def test_movie_search_director_nil
    assert_nil(Movie.movie_search_director("hi derek"))
  end

  def test_bechdel_result_true
 	  assert_equal(true, @movie1.bechdel_result)
  end

  def test_bechdel_result_false
 	  assert_equal(false, @movie2.bechdel_result)
  end

  def test_bechdel_result_nil
 	  assert_nil(@movie3.bechdel_result)
  end

  def test_top_movies_array
    assert_includes(Movie.top_movies_array, "Bandit Queen")
    refute_includes(Movie.top_movies_array, "Jurassic Park")
  end
end



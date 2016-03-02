require 'test_helper'

class MovieTest < Minitest::Test
  def setup
    super

    @movie1 = Movie.new
    @movie1.title = "Barfi"
    @movie1.director = "some dude"
    @movie1.image = "this is a picture"
    @movie1.critic_rating = "100"
    @movie1.save

    @movie2 = Movie.new
    @movie2.title = "Hello Beth"
    @movie2.director = "some lady"
    @movie2.image = "this is picture"
    @movie2.critic_rating = "100"
    @movie2.save

    @movie3 = Movie.new
    @movie3.title = "Hello Class"
    @movie3.director = "some dude"
    @movie3.image = "this is another picture"
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
    @result2.user_id = 1
    @result2.save

   end

   def test_set_qs_to_nil
    @result2.set_qs_to_nil
   	assert_nil(@result2.q1)
    assert_nil(@result2.q2)
    assert_nil(@result2.q3)
   end

   def test_results_passing
   	assert_includes(Result.passing, @result1)
    refute_includes(Result.passing, @result2)
   end

   def test_results_passing_nil
    @result1.q1 = false
    @result1.q2 = true
    @result1.q3 = true
    @result1.save

    assert_nil(Result.passing)
   end

   def test_get_id
   	assert_equal(@result1.get_id, @movie1)
    refute_equal(@result1.get_id, @movie2)
   end

   def test_get_image
   	assert_includes(@result1.get_image, @movie1.image)
    refute_includes(@result1.get_image, @movie2.image)
   end

  def test_set_errors
    assert_includes(@result1.set_errors, "Must be logged in to add or edit the Bechdel rating.")
  end

  def test_get_errors
    @result1.set_errors
    assert_includes(@result1.get_errors, "Must be logged in to add or edit the Bechdel rating.")
  end

  def test_is_not_valid
    @result1.set_errors
    assert_equal(false, @result1.is_valid)
  end

   def test_is_valid
    @result2.set_errors
    assert_equal(true, @result2.is_valid)
  end 
end



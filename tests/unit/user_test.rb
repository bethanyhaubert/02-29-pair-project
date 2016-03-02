require 'test_helper'

class UserTest < Minitest::Test
  def setup
    super

    @user1 = User.new
    @user1.name = "Barfi"
    @user1.email = "barfi@gmail.com"
    @user1.password = "password"
    @user1.save

    @user2 = User.new
    @user2.name = ""
    @user2.email = ""
    @user2.password = ""
    @user2.save

    @user1.set_errors
   end

  def test_set_errors
    @user3 = User.new
    @user3.name = ""
    @user3.email = "barfi@gmail.com"
    @user3.password = ""
    @user3.save

    assert_includes(@user2.set_errors, "Name cannot be blank")
    assert_includes(@user2.set_errors, "Email cannot be blank")
    assert_includes(@user2.set_errors, "Must choose a password")
    assert_includes(@user3.set_errors, "An account already exists for this email address.")
  end

  def test_get_errors
    @user2.set_errors
    assert_includes(@user2.get_errors, "Name cannot be blank")
  end

  def test_is_not_valid
    @user2.set_errors
    assert_equal(false, @user2.is_valid)
  end

  def test_is_valid
    binding.pry
    assert_equal(true, @user1.is_valid)
  end 

end



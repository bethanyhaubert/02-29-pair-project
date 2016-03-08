require 'test_helper'

class AuthenticationTest < Minitest::Test
  def setup
    super
    @user = User.new
    @user.name = "Derek"
    @user.email = "derek@gmail.com"
    @user.password = "stuff"
    @user.save

    @user1 = User.new
    @user1.name = "Barfi"
    @user1.email = "barfi@gmail.com"
    @user1.password = "password"

    @user2 = User.new
    @user2.name = ""
    @user2.email = ""
    @user2.password = ""

    @user3 = User.new
    @user3.name = ""
    @user3.email = "derek@gmail.com"
    @user3.password = ""

    @login1 =  Authentication.new("derek@gmail.com", "stuff")
  end

  def test_initialize
    assert_equal(@email, "derek@gmail.com")
    assert_equal(@password, "stuff")
  end

  def test_params_empty
    assert_equal(false, @login1.params_empty)
  end

  def test_user_exists
    @user2.empty_errors
    @user2.set_errors
    assert_includes(@user2.get_errors, "Name cannot be blank")
  end

  def test_user_object
    @user2.empty_errors
    @user2.set_errors
    assert_includes(@user2.get_errors, "Name cannot be blank")
  end

def test_set_errors
    @user2.empty_errors
    assert_includes(@user2.set_errors, "Name cannot be blank")
    assert_includes(@user2.set_errors, "Email cannot be blank")
    assert_includes(@user2.set_errors, "Must choose a password")
  end

  def test_get_errors
    @user2.empty_errors
    @user2.set_errors
    assert_includes(@user2.get_errors, "Name cannot be blank")
  end

  def test_is_not_valid
    @user2.empty_errors
    @user2.set_errors
    assert_equal(false, @user2.is_valid)
  end

  def test_is_valid
    @user1.empty_errors
    @user1.set_errors
    assert_equal(true, @user1.is_valid)
  end 
end


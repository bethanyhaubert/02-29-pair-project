require 'test_helper'

class AuthenticationTest < Minitest::Test
  def setup
    super
    @user = User.new
    @user.name = "Derek"
    @user.email = "derek@gmail.com"
    @user.password = "stuff"
    @user.save

    @login1 =  Authentication.new("derek@gmail.com", "stuff")

    @login2 =  Authentication.new("", "")

    @login3 =  Authentication.new("d@gmail.com", "cat")

    @login4 =  Authentication.new("derek@gmail.com", "cat")
  end


  def test_params_empty_false
    assert_equal(false, @login1.params_empty?)
  end

   def test_params_empty_true
    assert_equal(true, @login2.params_empty?)
  end

  def test_user_exists_true
    assert_equal(true, @login1.user_exists?)
  end

  def test_user_exists_false
    assert_equal(false, @login3.user_exists?)
  end

  def test_set_errors
    assert_includes(@login2.set_errors, "Please fill out the login form completely before submitting")
    assert_includes(@login3.set_errors, "User with this email does not exist")
    assert_includes(@login4.set_errors, "Incorrect password")
  end

  def test_get_errors
    @login2.set_errors
    assert_includes(@login2.get_errors, "Please fill out the login form completely before submitting")
  end

  def test_is_not_valid
    @login2.set_errors
    assert_equal(false, @login2.is_valid)
  end

  def test_is_valid
    @login1.set_errors
    assert_equal(true, @login1.is_valid)
  end 
end


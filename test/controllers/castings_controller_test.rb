require "test_helper"

class CastingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casting = castings(:one)
  end

  test "should get index" do
    get castings_url
    assert_response :success
  end

  test "should get new" do
    get new_casting_url
    assert_response :success
  end

  test "should create casting" do
    assert_difference("Casting.count") do
      post castings_url, params: { casting: { description: @casting.description, name: @casting.name } }
    end

    assert_redirected_to casting_url(Casting.last)
  end

  test "should show casting" do
    get casting_url(@casting)
    assert_response :success
  end

  test "should get edit" do
    get edit_casting_url(@casting)
    assert_response :success
  end

  test "should update casting" do
    patch casting_url(@casting), params: { casting: { description: @casting.description, name: @casting.name } }
    assert_redirected_to casting_url(@casting)
  end

  test "should destroy casting" do
    assert_difference("Casting.count", -1) do
      delete casting_url(@casting)
    end

    assert_redirected_to castings_url
  end
end

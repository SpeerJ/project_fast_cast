require "test_helper"

class ActorPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor_photo = actor_photos(:one)
  end

  test "should get index" do
    get actor_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_actor_photo_url
    assert_response :success
  end

  test "should create actor_photo" do
    assert_difference("ActorPhoto.count") do
      post actor_photos_url, params: { actor_photo: {} }
    end

    assert_redirected_to actor_photo_url(ActorPhoto.last)
  end

  test "should show actor_photo" do
    get actor_photo_url(@actor_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_photo_url(@actor_photo)
    assert_response :success
  end

  test "should update actor_photo" do
    patch actor_photo_url(@actor_photo), params: { actor_photo: {} }
    assert_redirected_to actor_photo_url(@actor_photo)
  end

  test "should destroy actor_photo" do
    assert_difference("ActorPhoto.count", -1) do
      delete actor_photo_url(@actor_photo)
    end

    assert_redirected_to actor_photos_url
  end
end

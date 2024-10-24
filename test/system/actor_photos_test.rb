require "application_system_test_case"

class ActorPhotosTest < ApplicationSystemTestCase
  setup do
    @actor_photo = actor_photos(:one)
  end

  test "visiting the index" do
    visit actor_photos_url
    assert_selector "h1", text: "Actor photos"
  end

  test "should create actor photo" do
    visit actor_photos_url
    click_on "New actor photo"

    click_on "Create Actor photo"

    assert_text "Actor photo was successfully created"
    click_on "Back"
  end

  test "should update Actor photo" do
    visit actor_photo_url(@actor_photo)
    click_on "Edit this actor photo", match: :first

    click_on "Update Actor photo"

    assert_text "Actor photo was successfully updated"
    click_on "Back"
  end

  test "should destroy Actor photo" do
    visit actor_photo_url(@actor_photo)
    click_on "Destroy this actor photo", match: :first

    assert_text "Actor photo was successfully destroyed"
  end
end

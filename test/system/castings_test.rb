require "application_system_test_case"

class CastingsTest < ApplicationSystemTestCase
  setup do
    @casting = castings(:one)
  end

  test "visiting the index" do
    visit castings_url
    assert_selector "h1", text: "Castings"
  end

  test "should create casting" do
    visit castings_url
    click_on "New casting"

    fill_in "Description", with: @casting.description
    fill_in "Name", with: @casting.name
    click_on "Create Casting"

    assert_text "Casting was successfully created"
    click_on "Back"
  end

  test "should update Casting" do
    visit casting_url(@casting)
    click_on "Edit this casting", match: :first

    fill_in "Description", with: @casting.description
    fill_in "Name", with: @casting.name
    click_on "Update Casting"

    assert_text "Casting was successfully updated"
    click_on "Back"
  end

  test "should destroy Casting" do
    visit casting_url(@casting)
    click_on "Destroy this casting", match: :first

    assert_text "Casting was successfully destroyed"
  end
end

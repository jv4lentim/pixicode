require "application_system_test_case"

class AlbumsTest < ApplicationSystemTestCase
  setup do
    @album = albums(:one)
  end

  test "visiting the index" do
    visit albums_url
    assert_selector "h1", text: "albums"
  end

  test "should create album" do
    visit albums_url
    click_on "New album"

    fill_in "Category", with: @album.category
    fill_in "Description", with: @album.description
    fill_in "Qr code", with: @album.qr_code
    fill_in "Start date", with: @album.start_date
    fill_in "Title", with: @album.title
    fill_in "User", with: @album.user_id
    click_on "Create album"

    assert_text "album was successfully created"
    click_on "Back"
  end

  test "should update album" do
    visit album_url(@album)
    click_on "Edit this album", match: :first

    fill_in "Category", with: @album.category
    fill_in "Description", with: @album.description
    fill_in "Qr code", with: @album.qr_code
    fill_in "Start date", with: @album.start_date.to_s
    fill_in "Title", with: @album.title
    fill_in "User", with: @album.user_id
    click_on "Update album"

    assert_text "album was successfully updated"
    click_on "Back"
  end

  test "should destroy album" do
    visit album_url(@album)
    click_on "Destroy this album", match: :first

    assert_text "album was successfully destroyed"
  end
end

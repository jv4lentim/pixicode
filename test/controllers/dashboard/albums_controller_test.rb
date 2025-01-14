require "test_helper"

module Dashboard
  class AlbumsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @album = albums(:one)
    end

    test "should get index" do
      get albums_url
      assert_response :success
    end

    test "should get new" do
      get new_album_url
      assert_response :success
    end

    test "should create album" do
      assert_difference("album.count") do
        post albums_url, params: { album: { category: @album.category, description: @album.description, qr_code: @album.qr_code, start_date: @album.start_date, title: @album.title, user_id: @album.user_id } }
      end

      assert_redirected_to album_url(album.last)
    end

    test "should show album" do
      get album_url(@album)
      assert_response :success
    end

    test "should get edit" do
      get edit_album_url(@album)
      assert_response :success
    end

    test "should update album" do
      patch album_url(@album), params: { album: { category: @album.category, description: @album.description, qr_code: @album.qr_code, start_date: @album.start_date, title: @album.title, user_id: @album.user_id } }
      assert_redirected_to album_url(@album)
    end

    test "should destroy album" do
      assert_difference("album.count", -1) do
        delete album_url(@album)
      end

      assert_redirected_to albums_url
    end
  end
end

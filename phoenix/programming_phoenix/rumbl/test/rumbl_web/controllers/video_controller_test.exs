defmodule RumblWeb.VideoControllerTest do
  use RumblWeb.ConnCase

  import Rumbl.MultimediaFixtures

  @create_attrs %{description: "some description", title: "some title", url: "some url"}
  @update_attrs %{
    description: "some updated description",
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{description: nil, title: nil, url: nil}

  describe "index" do
    test "lists all videos", %{conn: conn} do
      conn = get(conn, ~p"/manage/videos")
      assert html_response(conn, 200) =~ "Listing Videos"
    end
  end

  describe "new video" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/manage/videos/new")
      assert html_response(conn, 200) =~ "New Video"
    end
  end

  describe "create video" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/manage/videos", video: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/manage/videos/#{id}"

      conn = get(conn, ~p"/manage/videos/#{id}")
      assert html_response(conn, 200) =~ "Video #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/manage/videos", video: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Video"
    end
  end

  describe "edit video" do
    setup [:create_video]

    test "renders form for editing chosen video", %{conn: conn, video: video} do
      conn = get(conn, ~p"/manage/videos/#{video}/edit")
      assert html_response(conn, 200) =~ "Edit Video"
    end
  end

  describe "update video" do
    setup [:create_video]

    test "redirects when data is valid", %{conn: conn, video: video} do
      conn = put(conn, ~p"/manage/videos/#{video}", video: @update_attrs)
      assert redirected_to(conn) == ~p"/manage/videos/#{video}"

      conn = get(conn, ~p"/manage/videos/#{video}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, video: video} do
      conn = put(conn, ~p"/manage/videos/#{video}", video: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Video"
    end
  end

  describe "delete video" do
    setup [:create_video]

    test "deletes chosen video", %{conn: conn, video: video} do
      conn = delete(conn, ~p"/manage/videos/#{video}")
      assert redirected_to(conn) == ~p"/manage/videos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/manage/videos/#{video}")
      end
    end
  end

  defp create_video(_) do
    video = video_fixture()
    %{video: video}
  end
end

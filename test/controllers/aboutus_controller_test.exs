defmodule SreeShasta.AboutusControllerTest do
  use SreeShasta.ConnCase

  alias SreeShasta.Aboutus
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, aboutus_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing aboutus"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, aboutus_path(conn, :new)
    assert html_response(conn, 200) =~ "New aboutus"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, aboutus_path(conn, :create), aboutus: @valid_attrs
    assert redirected_to(conn) == aboutus_path(conn, :index)
    assert Repo.get_by(Aboutus, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, aboutus_path(conn, :create), aboutus: @invalid_attrs
    assert html_response(conn, 200) =~ "New aboutus"
  end

  test "shows chosen resource", %{conn: conn} do
    aboutus = Repo.insert! %Aboutus{}
    conn = get conn, aboutus_path(conn, :show, aboutus)
    assert html_response(conn, 200) =~ "Show aboutus"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, aboutus_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    aboutus = Repo.insert! %Aboutus{}
    conn = get conn, aboutus_path(conn, :edit, aboutus)
    assert html_response(conn, 200) =~ "Edit aboutus"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    aboutus = Repo.insert! %Aboutus{}
    conn = put conn, aboutus_path(conn, :update, aboutus), aboutus: @valid_attrs
    assert redirected_to(conn) == aboutus_path(conn, :show, aboutus)
    assert Repo.get_by(Aboutus, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    aboutus = Repo.insert! %Aboutus{}
    conn = put conn, aboutus_path(conn, :update, aboutus), aboutus: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit aboutus"
  end

  test "deletes chosen resource", %{conn: conn} do
    aboutus = Repo.insert! %Aboutus{}
    conn = delete conn, aboutus_path(conn, :delete, aboutus)
    assert redirected_to(conn) == aboutus_path(conn, :index)
    refute Repo.get(Aboutus, aboutus.id)
  end
end

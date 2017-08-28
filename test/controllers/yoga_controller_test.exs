defmodule SreeShasta.YogaControllerTest do
  use SreeShasta.ConnCase

  alias SreeShasta.Yoga
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, yoga_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing yoga"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, yoga_path(conn, :new)
    assert html_response(conn, 200) =~ "New yoga"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, yoga_path(conn, :create), yoga: @valid_attrs
    assert redirected_to(conn) == yoga_path(conn, :index)
    assert Repo.get_by(Yoga, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, yoga_path(conn, :create), yoga: @invalid_attrs
    assert html_response(conn, 200) =~ "New yoga"
  end

  test "shows chosen resource", %{conn: conn} do
    yoga = Repo.insert! %Yoga{}
    conn = get conn, yoga_path(conn, :show, yoga)
    assert html_response(conn, 200) =~ "Show yoga"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, yoga_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    yoga = Repo.insert! %Yoga{}
    conn = get conn, yoga_path(conn, :edit, yoga)
    assert html_response(conn, 200) =~ "Edit yoga"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    yoga = Repo.insert! %Yoga{}
    conn = put conn, yoga_path(conn, :update, yoga), yoga: @valid_attrs
    assert redirected_to(conn) == yoga_path(conn, :show, yoga)
    assert Repo.get_by(Yoga, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    yoga = Repo.insert! %Yoga{}
    conn = put conn, yoga_path(conn, :update, yoga), yoga: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit yoga"
  end

  test "deletes chosen resource", %{conn: conn} do
    yoga = Repo.insert! %Yoga{}
    conn = delete conn, yoga_path(conn, :delete, yoga)
    assert redirected_to(conn) == yoga_path(conn, :index)
    refute Repo.get(Yoga, yoga.id)
  end
end

defmodule SreeShasta.AyurvedaControllerTest do
  use SreeShasta.ConnCase

  alias SreeShasta.Ayurveda
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, ayurveda_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ayurveda"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, ayurveda_path(conn, :new)
    assert html_response(conn, 200) =~ "New ayurveda"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, ayurveda_path(conn, :create), ayurveda: @valid_attrs
    assert redirected_to(conn) == ayurveda_path(conn, :index)
    assert Repo.get_by(Ayurveda, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, ayurveda_path(conn, :create), ayurveda: @invalid_attrs
    assert html_response(conn, 200) =~ "New ayurveda"
  end

  test "shows chosen resource", %{conn: conn} do
    ayurveda = Repo.insert! %Ayurveda{}
    conn = get conn, ayurveda_path(conn, :show, ayurveda)
    assert html_response(conn, 200) =~ "Show ayurveda"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, ayurveda_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    ayurveda = Repo.insert! %Ayurveda{}
    conn = get conn, ayurveda_path(conn, :edit, ayurveda)
    assert html_response(conn, 200) =~ "Edit ayurveda"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    ayurveda = Repo.insert! %Ayurveda{}
    conn = put conn, ayurveda_path(conn, :update, ayurveda), ayurveda: @valid_attrs
    assert redirected_to(conn) == ayurveda_path(conn, :show, ayurveda)
    assert Repo.get_by(Ayurveda, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    ayurveda = Repo.insert! %Ayurveda{}
    conn = put conn, ayurveda_path(conn, :update, ayurveda), ayurveda: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit ayurveda"
  end

  test "deletes chosen resource", %{conn: conn} do
    ayurveda = Repo.insert! %Ayurveda{}
    conn = delete conn, ayurveda_path(conn, :delete, ayurveda)
    assert redirected_to(conn) == ayurveda_path(conn, :index)
    refute Repo.get(Ayurveda, ayurveda.id)
  end
end

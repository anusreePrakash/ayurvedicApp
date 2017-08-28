defmodule SreeShasta.KalaripayattuControllerTest do
  use SreeShasta.ConnCase

  alias SreeShasta.Kalaripayattu
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, kalaripayattu_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing kalaripayattu"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, kalaripayattu_path(conn, :new)
    assert html_response(conn, 200) =~ "New kalaripayattu"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, kalaripayattu_path(conn, :create), kalaripayattu: @valid_attrs
    assert redirected_to(conn) == kalaripayattu_path(conn, :index)
    assert Repo.get_by(Kalaripayattu, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, kalaripayattu_path(conn, :create), kalaripayattu: @invalid_attrs
    assert html_response(conn, 200) =~ "New kalaripayattu"
  end

  test "shows chosen resource", %{conn: conn} do
    kalaripayattu = Repo.insert! %Kalaripayattu{}
    conn = get conn, kalaripayattu_path(conn, :show, kalaripayattu)
    assert html_response(conn, 200) =~ "Show kalaripayattu"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, kalaripayattu_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    kalaripayattu = Repo.insert! %Kalaripayattu{}
    conn = get conn, kalaripayattu_path(conn, :edit, kalaripayattu)
    assert html_response(conn, 200) =~ "Edit kalaripayattu"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    kalaripayattu = Repo.insert! %Kalaripayattu{}
    conn = put conn, kalaripayattu_path(conn, :update, kalaripayattu), kalaripayattu: @valid_attrs
    assert redirected_to(conn) == kalaripayattu_path(conn, :show, kalaripayattu)
    assert Repo.get_by(Kalaripayattu, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    kalaripayattu = Repo.insert! %Kalaripayattu{}
    conn = put conn, kalaripayattu_path(conn, :update, kalaripayattu), kalaripayattu: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit kalaripayattu"
  end

  test "deletes chosen resource", %{conn: conn} do
    kalaripayattu = Repo.insert! %Kalaripayattu{}
    conn = delete conn, kalaripayattu_path(conn, :delete, kalaripayattu)
    assert redirected_to(conn) == kalaripayattu_path(conn, :index)
    refute Repo.get(Kalaripayattu, kalaripayattu.id)
  end
end

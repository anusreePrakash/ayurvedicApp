defmodule SreeShasta.AppoinmentControllerTest do
  use SreeShasta.ConnCase

  alias SreeShasta.Appoinment
  @valid_attrs %{date_and_time: "some content", email: "some content", first_name: "some content", last_name: "some content", mobile: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, appoinment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing appoinments"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, appoinment_path(conn, :new)
    assert html_response(conn, 200) =~ "New appoinment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, appoinment_path(conn, :create), appoinment: @valid_attrs
    assert redirected_to(conn) == appoinment_path(conn, :index)
    assert Repo.get_by(Appoinment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, appoinment_path(conn, :create), appoinment: @invalid_attrs
    assert html_response(conn, 200) =~ "New appoinment"
  end

  test "shows chosen resource", %{conn: conn} do
    appoinment = Repo.insert! %Appoinment{}
    conn = get conn, appoinment_path(conn, :show, appoinment)
    assert html_response(conn, 200) =~ "Show appoinment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, appoinment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    appoinment = Repo.insert! %Appoinment{}
    conn = get conn, appoinment_path(conn, :edit, appoinment)
    assert html_response(conn, 200) =~ "Edit appoinment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    appoinment = Repo.insert! %Appoinment{}
    conn = put conn, appoinment_path(conn, :update, appoinment), appoinment: @valid_attrs
    assert redirected_to(conn) == appoinment_path(conn, :show, appoinment)
    assert Repo.get_by(Appoinment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    appoinment = Repo.insert! %Appoinment{}
    conn = put conn, appoinment_path(conn, :update, appoinment), appoinment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit appoinment"
  end

  test "deletes chosen resource", %{conn: conn} do
    appoinment = Repo.insert! %Appoinment{}
    conn = delete conn, appoinment_path(conn, :delete, appoinment)
    assert redirected_to(conn) == appoinment_path(conn, :index)
    refute Repo.get(Appoinment, appoinment.id)
  end
end

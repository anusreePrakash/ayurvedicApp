defmodule SreeShasta.AppoinmentTest do
  use SreeShasta.ModelCase

  alias SreeShasta.Appoinment

  @valid_attrs %{date_and_time: "some content", email: "some content", first_name: "some content", last_name: "some content", mobile: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Appoinment.changeset(%Appoinment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Appoinment.changeset(%Appoinment{}, @invalid_attrs)
    refute changeset.valid?
  end
end

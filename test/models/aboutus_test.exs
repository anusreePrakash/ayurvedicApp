defmodule SreeShasta.AboutusTest do
  use SreeShasta.ModelCase

  alias SreeShasta.Aboutus

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Aboutus.changeset(%Aboutus{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Aboutus.changeset(%Aboutus{}, @invalid_attrs)
    refute changeset.valid?
  end
end

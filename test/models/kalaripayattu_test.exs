defmodule SreeShasta.KalaripayattuTest do
  use SreeShasta.ModelCase

  alias SreeShasta.Kalaripayattu

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Kalaripayattu.changeset(%Kalaripayattu{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Kalaripayattu.changeset(%Kalaripayattu{}, @invalid_attrs)
    refute changeset.valid?
  end
end

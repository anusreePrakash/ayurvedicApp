defmodule SreeShasta.YogaTest do
  use SreeShasta.ModelCase

  alias SreeShasta.Yoga

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Yoga.changeset(%Yoga{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Yoga.changeset(%Yoga{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule SreeShasta.AyurvedaTest do
  use SreeShasta.ModelCase

  alias SreeShasta.Ayurveda

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ayurveda.changeset(%Ayurveda{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ayurveda.changeset(%Ayurveda{}, @invalid_attrs)
    refute changeset.valid?
  end
end

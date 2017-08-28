defmodule SreeShasta.Ayurveda do
  use SreeShasta.Web, :model

  schema "ayurveda" do

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end

defmodule SreeShasta.Contact do
  use SreeShasta.Web, :model

  schema "contacts" do
    field :name, :string
    field :email, :string
    field :mobile, :string
    field :message, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :mobile, :message])
    |> validate_required([:name, :email, :mobile, :message])
  end
end

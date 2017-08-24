defmodule SreeShasta.Appoinment do
  use SreeShasta.Web, :model

  schema "appoinments" do
    field :first_name, :string
    field :last_name, :string
    field :date_and_time, :string
    field :mobile, :string
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :date_and_time, :mobile, :email])
    |> validate_required([:first_name, :last_name, :date_and_time, :mobile, :email])
  end

end

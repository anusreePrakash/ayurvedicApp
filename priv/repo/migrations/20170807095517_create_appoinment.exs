defmodule SreeShasta.Repo.Migrations.CreateAppoinment do
  use Ecto.Migration

  def change do
    create table(:appoinments) do
      add :first_name, :string
      add :last_name, :string
      add :date_and_time, :string
      add :mobile, :string
      add :email, :string

      timestamps()
    end

  end
end

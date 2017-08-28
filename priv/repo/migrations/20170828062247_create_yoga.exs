defmodule SreeShasta.Repo.Migrations.CreateYoga do
  use Ecto.Migration

  def change do
    create table(:yoga) do

      timestamps()
    end

  end
end

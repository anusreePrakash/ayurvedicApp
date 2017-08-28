defmodule SreeShasta.Repo.Migrations.CreateAyurveda do
  use Ecto.Migration

  def change do
    create table(:ayurveda) do

      timestamps()
    end

  end
end

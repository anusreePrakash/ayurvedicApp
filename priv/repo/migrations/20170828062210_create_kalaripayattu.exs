defmodule SreeShasta.Repo.Migrations.CreateKalaripayattu do
  use Ecto.Migration

  def change do
    create table(:kalaripayattu) do

      timestamps()
    end

  end
end

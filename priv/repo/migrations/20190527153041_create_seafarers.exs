defmodule Demo.Repo.Migrations.CreateSeafarers do
  use Ecto.Migration

  def change do
    create table(:seafarers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :country, :string
    end
    create unique_index(:seafarers, [:id])
  end
end

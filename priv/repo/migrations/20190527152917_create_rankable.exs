defmodule Demo.Repo.Migrations.CreateRankable do
  use Ecto.Migration

  def change do
    create table(:rankable, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :seafarer_id, :binary_id
      add :seafarer_ranking_id, :binary_id
    end
    create unique_index(:rankable, [:id])
  end
end

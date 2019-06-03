defmodule Demo.Repo.Migrations.CreateSeafarerRanking do
  use Ecto.Migration

  def change do
    create table(:seafarer_ranking, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :job_ranking, :string
      add :sub, :string
    end
    create unique_index(:seafarer_ranking, [:id])
  end
end

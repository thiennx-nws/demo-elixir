defmodule Demo.Rankable do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: false}
  schema "rankable" do
    belongs_to :seafarer, Demo.Seafarer, foreign_key: :seafarer_id, type: :binary_id
    belongs_to :seafarer_ranking, Demo.SeafarerRanking, foreign_key: :seafarer_ranking_id, type: :binary_id
  end

  @doc false
  def changeset(rankable, attrs) do
    rankable
    |> cast(attrs, [:seafarer_id, :seafarer_ranking_id])
    |> validate_required([:seafarer_id, :seafarer_ranking_id])
  end
end

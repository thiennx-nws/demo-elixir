defmodule Demo.SeafarerRanking do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  schema "seafarer_ranking" do
    field :job_ranking, :string
    field :sub, :string

    many_to_many :seafarers, Demo.Seafarer, join_through: "rankable"
  end

  @doc false
  def changeset(seafarer_ranking, attrs) do
    seafarer_ranking
    |> cast(attrs, [:job_ranking, :sub])
    |> validate_required([:job_ranking, :sub])
  end
end

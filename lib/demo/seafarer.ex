defmodule Demo.Seafarer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  schema "seafarers" do
    field :name, :string
    field :country, :string
    many_to_many :seafarers_ranking, Demo.SeafarerRanking, join_through: "rankable"
  end

  @doc false
  def changeset(seafarer, attrs) do
    seafarer
    |> cast(attrs, [:id, :name, :country])
    |> validate_required([:id, :name, :country])
    |> unique_constraint(:id, name: "seafarers_pkey", message: "Id is exist")
  end
end

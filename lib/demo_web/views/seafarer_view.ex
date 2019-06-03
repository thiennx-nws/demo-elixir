defmodule DemoWeb.SeafarerView do
  use DemoWeb, :view

  def render("index.json", %{seafarers: seafarers, seafarers_ranking: seafarers_ranking}) do
    %{
      data: Enum.map(seafarers, &seafarer_json/1),
      included: Enum.map(seafarers_ranking, &seafarer_ranking_json/1)
    }
  end

  def seafarer_json(seafarer) do
    seafarers_ranking = Enum.map(seafarer.seafarers_ranking, fn x -> seafarer_ranking_json(x) end)
    %{
      id: seafarer.id,
      type: "Seafarers",
      relationships: %{
        seafarer_ranks: %{
          data: seafarers_ranking
        }
      },
      attributes: %{
        id: seafarer.id,
        name: seafarer.name,
        country: seafarer.country,
      }
    }
  end

  def seafarer_ranking_json(seafarer_ranking_json) do
    %{
      id: seafarer_ranking_json.id,
      type: "SeafarerRanking",
      attributes: %{
        id: seafarer_ranking_json.id,
        name: seafarer_ranking_json.job_ranking,
        sub: seafarer_ranking_json.sub,
      }
    }
  end
end

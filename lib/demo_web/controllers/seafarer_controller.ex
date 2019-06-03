defmodule DemoWeb.SeafarerController do
  use DemoWeb, :controller
  alias Demo.Repo
  alias Demo.Seafarer
  alias Demo.SeafarerRanking
  alias Demo.Rankable

  def index(conn, _params) do
    seafarers_ranking = Repo.all(SeafarerRanking)
    seafarers = Repo.all(Seafarer)
    |> Repo.preload(:seafarers_ranking)
    render(conn, %{seafarers: seafarers, seafarers_ranking: seafarers_ranking})
  end
end
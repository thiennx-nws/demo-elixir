# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Demo.Repo.insert!(%Demo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
require IEx
NimbleCSV.define(MyParser, separator: "\t", escape: "\"")
alias Demo.Seafarer
alias Demo.SeafarerRanking
alias Demo.Rankable

IO.puts "Import Seafarer"
data_seafarer = "./data/seafarers.csv"
|> Path.expand(__DIR__)
|> File.read!
|> String.split("\r\n")
|> Enum.map(fn string -> 
  [id, name, country] = String.split(string, ",")
  %{id: id, name: name, country: country}
end)
Demo.Repo.insert_all Seafarer, data_seafarer
IO.puts "Import Seafarer Done"

IO.puts "Import Seafarer Rank"

data_seafarer_rank = "./data/seafarer_ranks.csv"
|> Path.expand(__DIR__)
|> File.read!
|> String.split("\r\n")
|> Enum.map(fn string -> 
  [id, job_ranking, sub] = String.split(string, ",")
  %{id: id, job_ranking: job_ranking, sub: sub}
end)

Demo.Repo.insert_all SeafarerRanking, data_seafarer_rank

IO.puts "Import SeafarerRanking Done"

IO.puts "Import Rankables"

data_rankable = "./data/rankables.csv"
|> Path.expand(__DIR__)
|> File.read!
|> String.split("\r\n")
|> Enum.map(fn string -> 
  [id, seafarer_id, seafarer_ranking_id] = String.split(string, ",")
  %{id: id, seafarer_id: seafarer_id, seafarer_ranking_id: seafarer_ranking_id}
end)

Demo.Repo.insert_all Rankable, data_rankable

IO.puts "Import Rankables Done"

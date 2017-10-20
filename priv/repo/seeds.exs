# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Takso.Repo.insert!(%Takso.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias Takso.{Repo, User, Taxi}

 [%{name: "Fred Flintstone", username: "fred", password: "parool"},
  %{name: "Barney Rubble", username: "barney", password: "parool"}]
 |> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
 |> Enum.each(fn changeset -> Repo.insert!(changeset) end)

[%{username: "john", location: "Raatuse 22, Tartu", status: "available"},
%{username: "barney", location: "Raatuse 22, Tartu", status: "available"}]
|> Enum.map(fn taxi_data -> Taxi.changeset(%Taxi{}, taxi_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)

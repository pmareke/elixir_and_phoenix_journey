defmodule Rumbl.Repo.Migrations.DeleteVideos do
  use Ecto.Migration

  def change do
    delete(table(:videos))
  end
end

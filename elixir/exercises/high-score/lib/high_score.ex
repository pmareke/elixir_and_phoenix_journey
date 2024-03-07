defmodule HighScore do
  @default_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_score)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn current_score -> current_score + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end

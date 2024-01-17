defmodule Lasagna do
  @doc """
  Methods for cooking a brilliant lasagna.
  """

  @lasagna_cooking_time 40
  @layer_preparation_time 2

  @spec expected_minutes_in_oven :: integer()
  def expected_minutes_in_oven do
    @lasagna_cooking_time
  end

  @spec remaining_minutes_in_oven(integer()) :: integer()
  def remaining_minutes_in_oven(elapsed) do
    expected_minutes_in_oven() - elapsed
  end

  @spec preparation_time_in_minutes(integer()) :: integer()
  def preparation_time_in_minutes(layers) do
    @layer_preparation_time * layers
  end

  @spec total_time_in_minutes(integer(), integer()) :: integer()
  def total_time_in_minutes(layers, elapsed) do
    preparation_time_in_minutes(layers) + elapsed
  end

  @spec alarm() :: String.t()
  def alarm() do
    "Ding!"
  end
end

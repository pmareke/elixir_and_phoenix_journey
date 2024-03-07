defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volumne} = volume_pair
    volumne
  end
  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end
  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * 240}
  end
  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * 30}
  end
  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * 5}
  end
  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * 15}
  end
  def from_milliliter({:milliliter, volume}, :milliliter) do
    {:milliliter, volume}
  end
  def from_milliliter({:milliliter, volume}, :cup) do
    {:cup, volume / 240}
  end
  def from_milliliter({:milliliter, volume}, :fluid_ounce) do
    {:fluid_ounce, volume / 30}
  end
  def from_milliliter({:milliliter, volume}, :teaspoon) do
    {:teaspoon, volume / 5}
  end
  def from_milliliter({:milliliter, volume}, :tablespoon) do
    {:tablespoon, volume / 15}
  end
  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end

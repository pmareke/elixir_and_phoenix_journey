defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100 - discount) / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    (apply_discount(daily_rate(hourly_rate), discount) * 22)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / (apply_discount(hourly_rate, discount) * 8.0))
    |> Float.floor(1)
  end
end

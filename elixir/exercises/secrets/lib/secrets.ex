defmodule Secrets do
  def secret_add(secret) do
    fn another -> another + secret end
  end

  def secret_subtract(secret) do
    fn another -> another - secret end
  end

  def secret_multiply(secret) do
    fn another -> another * secret end
  end

  def secret_divide(secret) do
    fn another -> div(another, secret) end
  end

  def secret_and(secret) do
    fn another -> Bitwise.band(another, secret) end
  end

  def secret_xor(secret) do
    fn another -> Bitwise.bxor(another, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn another -> secret_function2.(secret_function1.(another)) end
  end
end

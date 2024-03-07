defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    cleaned =
      case head do
        ?ß -> ~c"ss"
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        x when x >= ?a and x <= ?z -> [x]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    cleaned ++ sanitize(tail)
  end
end

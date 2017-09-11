defmodule FB.EventBundle do

  def split(%{"entry" => entries, "object" => "page"}) do
    entries
    |> Enum.map(&(&1["messaging"]))
    |> Enum.concat
  end
  
  def split(_bundle) do
    []
  end
end

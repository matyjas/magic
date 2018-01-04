defmodule FB.EventBundle do

  @moduledoc """
  Facebook sends multiple messages in one HTTP request, use this module to unbundle them
  """
  
  def split(%{"entry" => entries, "object" => "page"}) do
    entries
    |> Enum.map(&(&1["messaging"]))
    |> Enum.concat
  end
  
  def split(_bundle) do
    []
  end
end

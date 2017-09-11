defmodule FB.EventBundle do

  def split(%{"entry" => entries, "object" => "page"}) do
    entries
  end
  
  def split(_bundle) do
    []
  end
end

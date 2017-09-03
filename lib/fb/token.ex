defmodule FB.Token do

  def verify?("subscribe", token, challenge) do
    {:match, challenge}
  end

  def verify?(_, _, _) do
    {:miss}
  end
end

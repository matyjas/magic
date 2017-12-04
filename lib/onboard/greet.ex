defmodule Onboard.Greet do

  @greetings {"Looking for guided meditations? We have plenty!",
	      "Guided meditations of all sizes and shapes",
	      "If it is time to meditate, then you are in the right place"}
  
  def get(timestamp) do
    @greetings |> elem(rem(timestamp, 3))
  end
end

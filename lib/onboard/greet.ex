defmodule Onboard.Greet do

  @greetings {"Looking for guided meditations? We have plenty! This one is popular: ",
	      "Guided meditations of all sizes and shapes. The shape of this one is especially nice: ",
	      "If it is time to meditate, then you are in the right place and this is the right meditation: ",
	      "Oh, sorry I was just preparing for a meditation. Do you want to join me? This is the one I had in mind: "}
  
  def get(timestamp) do
    @greetings |> elem(rem(timestamp, 3))
  end
end

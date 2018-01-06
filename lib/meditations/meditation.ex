defmodule Meditations.Meditation do

  @moduledoc """
  Entity representing a meditation
  """

  alias __MODULE__

  @enforce_keys [:title, :date, :duration, :description, :audio_url]
  defstruct title: "", date: "", duration: "", description: "", audio_url: ""

  def sample() do
    %Meditation{title: "Meditation: Breath by Breath (2017-11-29)",
                date: "Thu, 30 Nov 2017 22:38:56 +0000",
                duration: "23:03",
                description: "Our breath can be a home base that allows us to meet life with a relaxed, wakeful presence. This meditation helps us calm and settle the mind with long deep breathing, and then establishes a mindful presence with our natural breathing. When distracted, we learn to relax back again and again, learning the pathway of homecoming to the aliveness, openness and mystery that is always Here.",
                audio_url: "http://hwcdn.libsyn.com/p/7/9/7/79712f21ad57f622/2017-11-29-Meditation-Breath-by-Breath-TaraBrach.mp3?c_id=17991040&destination_id=138667&expiration=1513063193&hwt=45ca1dfb85d7ecd975d3416233c8b1c6"
    }
  end
end

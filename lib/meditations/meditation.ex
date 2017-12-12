defmodule Meditations.Meditation do
  alias __MODULE__

  defstruct title: "", date: "", duration: "", description: "", audio_url: ""

  def sample() do
    %Meditation{title: "Meditation: Breath by Breath (2017-11-29)",
		date: "Thu, 30 Nov 2017 22:38:56 +0000",
		duration: "23:03",
		description: "Our breath can be a home base that allows us to meet life with a relaxed, wakeful presence. This meditation helps us calm and settle the mind with long deep breathing, and then establishes a mindful presence with our natural breathing. When distracted, we learn to relax back again and again, learning the pathway of homecoming to the aliveness, openness and mystery that is always Here.",
		audio_url: "http://hwcdn.libsyn.com/p/2/3/a/23adbfe5e9ed3042/2017-11-29-Pt1-Awakening-from-the-Trance-of-Fear-TaraBrach.mp3?c_id=18010057&destination_id=138667&expiration=1512979584&hwt=49524baea3a6fd99564b5abea6092436"
	#	"http://traffic.libsyn.com/tarabrach/2017-11-29-Meditation-Breath-by-Breath-TaraBrach.mp3?dest-id=138667"
    }
  end
end

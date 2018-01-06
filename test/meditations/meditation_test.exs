defmodule Meditations.MeditationTest do
  use MagicWeb.ConnCase, async: true

  alias Meditations.Meditation

  setup do
    body_scan = %Meditation{title: "Body Scan",
			    date: "2018-01-06",
			    duration: "20:47",
			    description: "The body scan has proven to be an extremely powerful and healing form of meditation.",
			    audio_url: "https://palousemindfulness.com/disks/bodyscan20min.mp3"}
    {:ok, meditation: body_scan}
  end
  
  test "has title", %{meditation: body_scan} do
    assert nil != body_scan.title
  end
end

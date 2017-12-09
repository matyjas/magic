defmodule Meditations.MeditationTest do
  use MagicWeb.ConnCase, async: true

  alias Meditations.Meditation

  test "has title" do
    medi = %Meditation{}
    assert nil != medi.title
  end
end

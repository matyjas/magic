defmodule Eight.BallTest do
  use MagicWeb.ConnCase, async: true

  alias Eight.Ball
  
  test "00 - It is certain" do
    assert "It is certain" == Ball.ask("will this test pass?", 1000)
  end

  test "20 - It is certain" do
    assert "It is certain" == Ball.ask("will this test pass?", 100020)
  end

  test "15 - Don't count on it" do
    assert "Don't count on it" == Ball.ask("is this test flakey?", 335)
  end

end

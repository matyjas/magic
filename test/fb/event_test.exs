defmodule FB.EventTest do
  use MagicWeb.ConnCase, async: true

  alias FB.Event

  test "pull sender id and timestamp" do
    sender_id = "mail man"
    timestamp = 1970
    message = %{"message" => %{"mid" => "mid.$cAABplXIuOB9knvP9e1eba6yAbG44",
			       "seq" => 7828, "text" => "@@@@@"},
		"recipient" => %{"id" => "116090092394138"},
		"sender" => %{"id" => sender_id},
		"timestamp" => timestamp}
    assert {sender_id, timestamp} == Event.extract_sender_timestamp(message)
  end
  
  test "echos are not sender messages" do
    echo = %{"message" => %{"is_echo" => true,
			    "mid" => "mid.$cAABplXIuOB9knvaEZ1ebbE7MJrUu", "seq" => 7830,
			    "text" => "its coole"},
	     "recipient" => %{"id" => "1646924535352518"},
             "sender" => %{"id" => "116090092394138"},
             "timestamp" => 1505078885479}
    assert false == Event.is_sender_message?(echo)
  end

  test "deliver is not a sender message" do
    delivery = %{"delivery" => %{"mids" => ["mid.$cAABplXIuOB9knvaEZ1ebbE7MJrUu"],
				 "seq" => 0, "watermark" => 1505078885479},
		 "recipient" => %{"id" => "116090092394138"},
		 "sender" => %{"id" => "1646924535352518"},
		 "timestamp" => 1505078886435}
    assert false == Event.is_sender_message?(delivery)
  end

  test "a sender message!" do
    sender_message = %{"message" => %{"mid" => "mid.$cAABplXIuOB9knvP9e1eba6yAbG44",
				      "seq" => 7828, "text" => "@@@@@"},
		       "recipient" => %{"id" => "116090092394138"},
		       "sender" => %{"id" => "1646924535352518"},
		       "timestamp" => 1505078719867}
    assert Event.is_sender_message? sender_message
  end

  test "pull recipient id" do
    recipient = "116090092394138"
    message = %{"message" => %{"mid" => "mid.$cAABplXIuOB9krpiNAFefVNOYxI4W",
			       "nlp" => %{"entities" => %{}},
			       "seq" => 7883, "text" => "what up?"},
		"recipient" => %{"id" => recipient},
		"sender" => %{"id" => "1646924535352518"}, "timestamp" => 1505341162752}
    assert recipient == Event.recipient message
  end
end

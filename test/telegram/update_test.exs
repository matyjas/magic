defmodule Telegram.UpdateTest do
  use MagicWeb.ConnCase, async: true

  alias Telegram.{Update}

  @start_mess_id 228303213
  @start_mess_date 1510610264
  @start_mess %{"message" => %{"chat" => %{"first_name" => "Maciej",
  "id" => @start_mess_id,
    "type" => "private",
    "username" => "Matyjas"},
  "date" => @start_mess_date,
  "entities" => [%{"length" => 6,
                   "offset" => 0,
		   "type" => "bot_command"}],
  "from" => %{
    "first_name" => "Maciej",
    "id" => 228303213,
    "is_bot" => false,
    "language_code" => "en",
    "username" => "Matyjas"},
  "message_id" => 1,
  "text" => "/start"}, "update_id" => 158840565}

  @samp_mess_id 228303213
  @samp_mess_date 1510610291
  @samp_mess %{"message" => %{
  "chat" => %{
    "first_name" => "Maciej",
    "id" => @samp_mess_id,
    "type" => "private",
    "username" => "Matyjas"},
  "date" => @samp_mess_date,
  "from" => %{
    "first_name" => "Maciej",
    "id" => 228303213,
    "is_bot" => false,
    "language_code" => "en",
    "username" => "Matyjas"},
  "message_id" => 2,
  "text" => "Test"}, "update_id" => 158840566}
  
  test "sad path" do
    {unhandled_update_type} = Update.extract_sender_date("boo")
    assert :unhandled_update_type == unhandled_update_type
  end

  test "initial message" do
    {sender_id, date} = Update.extract_sender_date(@start_mess)
    assert @start_mess_id == sender_id
    assert @start_mess_date == date
  end

  test "sample message" do
    {sender_id, date} = Update.extract_sender_date(@samp_mess)
    assert @samp_mess_id == sender_id
    assert @samp_mess_date == date
  end
end

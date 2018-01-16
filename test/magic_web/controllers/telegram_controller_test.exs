defmodule MagicWeb.TelegramControllerTest do
  use MagicWeb.ConnCase

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
  
  test "200 for the win", %{conn: conn} do
    response = post conn, "/api/telegram/v0", @samp_mess
    assert response.status == 200
  end
end

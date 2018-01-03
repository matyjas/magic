defmodule Telegram.Update do

  @moduledoc """
  Entity for working with `Update` messages from Telegram
  """
  
  def extract_sender_date(%{"message" => %{"chat" => %{"id" => sender_id},
                                          "date" => date}}) do
    {:ok, sender_id, date}
  end

  def extract_sender_date(update) do
    IO.put "WARNING :: unhandled update from messaging platform>>"
    IO.put update       
    {:unhandled_update_type, update}
  end
end

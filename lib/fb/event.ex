defmodule FB.Event do

  @moduledoc """
  Entity for working with events from Facebook Messenger
  """
  
  def recipient(%{"recipient" => %{"id" => recipient}}) do
    recipient
  end

  def extract_sender_timestamp(%{"sender" => %{"id" => sender},
              "timestamp" => timestamp}) do
    {sender, timestamp}
  end
  
  def is_sender_message?(%{"message" => message}) do
    !is_message_echo?(message)
  end

  def is_sender_message?(_) do
    false
  end

  def is_message_echo?(%{"is_echo" => true}) do
    true
  end

  def is_message_echo?(_) do
    false
  end
end

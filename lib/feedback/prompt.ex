defmodule Feedback.Prompt do

  @moduledoc """
  Entity for feedback text, used as a last resort if we dont know what a user wants
  """
  
  @feedback_url "https://maciejmatyjas.typeform.com/to/HCTng6"
  
  @requests {"Please let us know how we are doing",
             "Feedback please",
             "Something appears to have gone wrong, your comments would be appreciated"}

  def url(), do: @feedback_url 

  def text(timestamp), do: elem(@requests, rem(timestamp, 3))
end

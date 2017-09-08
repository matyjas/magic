defmodule FB.Token do

  @sys_env_fb_token Application.get_env(:magic, :fb, :token)[:token]

  def local_value, do: @sys_env_fb_token
  
  def verify?(@sys_env_fb_token, challenge) do
    {:match, challenge}
  end

  def verify?(_, _) do
    {:miss}
  end
end

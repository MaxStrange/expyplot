defmodule Expyplot do
  use Application
  @moduledoc """
  This is the supervisor that runs the application.
  """

  def start(_type, _args) do
    Server.Commapi.start_link
  end
end

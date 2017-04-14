defmodule Expyplot do
  use Application
  @moduledoc """
  This is the supervisor that runs the application.
  For now, this module doesn't really do anything else.
  """

  def start(_type, _args) do
    Server.Pysupervisor.start_link
    # TODO: sit around until python starts up
    #Server.Commapi.start_link
  end
end

defmodule Booker.Auth.AdminPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    current_user = conn.assigns.current_user
    case current_user.is_admin do
      true ->
        conn
      false ->
        conn
          |> put_status(:unathorized)
          |> halt
    end
  end
end

defmodule Phoenix.LiveDashboard.Web do
  @moduledoc false

  @doc false
  def view do
    quote do
      @moduledoc false

      use Phoenix.View,
        namespace: Phoenix.LiveDashboard,
        root: "lib/phoenix/live_dashboard/templates"

      unquote(view_helpers())
    end
  end

  @doc false
  def live_view do
    quote do
      @moduledoc false

      use Phoenix.LiveView,
        layout: {Phoenix.LiveDashboard.LayoutView, "live.html"}

      unquote(view_helpers())
    end
  end

  @doc false
  def live_component do
    quote do
      @moduledoc false

      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  defp view_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      # Import convenience functions for LiveView rendering
      import Phoenix.LiveView.Helpers

      # Import routing functions
      import Phoenix.LiveDashboard.Web
    end
  end

  @doc """
  Convenience helper for using the functions above.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  @doc """
  Computes a route path to the live dashboard.
  """
  def live_dashboard_path(socket, action, args \\ []) do
    apply(socket.router.__helpers__(), :live_dashboard_path, [socket, action | args])
  end
end

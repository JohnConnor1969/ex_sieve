defmodule ExSieve.Builder.Join do
  @moduledoc false
  alias Ecto.Query.Builder.Join

  @spec build(Ecto.Queryable.t, Macro.t) :: Ecto.Query.t
  def build(query, relations) do
    relations |> Enum.reduce(query, &apply_join(&1, &2))
  end

  defp apply_join(relation, query) do
    query
    |> Macro.escape
    |> Join.build(:inner, [query: 0], expr(relation), nil, nil, __ENV__)
    |> elem(0)
    |> Code.eval_quoted
    |> elem(0)
  end

  defp expr(relation) do
    quote do
      unquote(Macro.var(relation, Elixir)) in assoc(query, unquote(relation))
    end
  end
end

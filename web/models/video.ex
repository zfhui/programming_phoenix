defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :view_count, :integer
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumble.Category

    timestamps
  end

  @required_fields ~w(url title description)
  @optional_fields ~w(view_count category_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> assoc_constraint(:category)
  end
end

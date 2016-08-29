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
  @required_fields ~w(category_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description, :view_count])
    |> validate_required([:url, :title, :description, :view_count])
  end
end

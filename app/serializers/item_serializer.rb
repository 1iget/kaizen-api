class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category, :user_id, :editable

  def editable
    scope == object.user
  end
end

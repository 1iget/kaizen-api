class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category, :user_id
end

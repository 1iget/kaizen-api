class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :user, :item
end

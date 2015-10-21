class SessionSerializer < ActiveModel::Serializer
  attributes :id, :token, :score
end

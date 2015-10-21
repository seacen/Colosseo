class SessionSerializer < ActiveModel::Serializer
  attributes :id, :token, :score, :username
end

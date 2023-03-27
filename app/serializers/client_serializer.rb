class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  def total
    self.object.memberships.sum(:charge)
  end
end

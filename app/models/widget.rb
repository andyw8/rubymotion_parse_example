class Widget < ParseObject
  def self.store
    WidgetStore.shared_store
  end

  # TODO shouldn't this be in store?
  def name=(name)
    @object['name'] = name
  end

  def save
    @object.save
  end
end

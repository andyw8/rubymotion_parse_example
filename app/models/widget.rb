class Widget < ParseObject
  def self.store
    WidgetStore.shared_store
  end
end

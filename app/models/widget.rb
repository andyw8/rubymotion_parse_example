class Widget < ParseObject
  def name
    @object['name']
  end

  def store
    WidgetStore
  end
end

class Widget < ParseObject
  def name
    @object['foo']
  end
end
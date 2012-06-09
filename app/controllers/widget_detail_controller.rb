class WidgetDetailController < UIViewController
  attr_writer :item

  def parse_object_class
    Widget
  end

  def loadView
    self.view = WidgetDetailView.alloc.init
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor
    self.title = "New #{parse_object_class.name}"
  end
end

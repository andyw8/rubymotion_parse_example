class AddWidgetController < UIViewController
  def parse_object_class
    Widget
  end

  def loadView
    self.view = AddWidgetView.alloc.init
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor
    self.title = "New #{parse_object_class.name}"
  end
end

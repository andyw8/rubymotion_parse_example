module ControllerOperations
  module Show
    def show(item)
      @controller = WidgetDetailController.alloc.initWithItem(item)
      self.navigationController.pushViewController(@controller, animated: true)
    end
  end
end

module ControllerOperations
  module Edit
    def edit(item)
      @controller = WidgetDetailController.alloc.initWithItem(item, edit: true)
      self.navigationController.pushViewController(@controller, animated: true)
    end
  end
end

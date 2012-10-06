module ControllerOperations
  module Add
    def addItem
      @controller = WidgetDetailController.alloc.init # TODO is this the same as new?
      self.navigationController.pushViewController(@controller, animated: true)
    end

    def addButtonItem
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemAdd, target:self, action:'addItem')
    end
  end
end
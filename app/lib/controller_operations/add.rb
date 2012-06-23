module ControllerOperations
  module Add
    def addItem
      dc = detail_controller
      dc.dismiss_block = lambda do
        model_class.expire_cache
        self.tableView.reloadData
      end
      self.presentViewController(dc, animated:true, completion:nil)
    end

    def addButtonItem
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemAdd, target:self, action:'addItem')
    end
  end
end

module ControllerOperations
  module Show
    def show(item)
      dc = detail_controller
        dc.item = item
        dc.dismiss_block = lambda do
          model_class.expire_cache
        self.tableView.reloadData
      end
      presentViewController(dc, animated:true, completion:nil)
    end
  end
end
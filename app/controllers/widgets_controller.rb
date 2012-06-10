class WidgetsController < UITableViewController
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = reuseable_cell
    item = Widget.item_at_index(indexPath.row)
    cell.textLabel.text = item.name
    cell.detailTextLabel.text = item.created_at.to_s
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    selected_item = Widget.item_at_index(indexPath.row)
    viewItem selected_item
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    WidgetStore.delete_item_at_index indexPath.row
  end

  def viewDidLoad
    self.title = "Wigets"
    navigationItem.rightBarButtonItem = addButtonItem
    navigationItem.leftBarButtonItem = self.editButtonItem
  end

  def tableView(tableView, numberOfRowsInSection:section)
    store.count
  end

  def addItem
    controller = WidgetDetailController.alloc.init
    controller.dismiss_block = lambda do
      Widget.expire_cache
      self.tableView.reloadData
    end
    empty_block = lambda {} # TODO needed to avoid crash, but why?
    self.presentViewController(controller, animated:true, completion:empty_block)
  end

  def viewItem(item)
    controller = WidgetDetailController.alloc.init
    controller.item = item
    # TODO does this need to be an ivar?
    @completion = lambda do
      # TODO
    end
    controller.dismiss_block = @completion
    self.presentViewController(controller, animated:true, completion:@completion)
  end

  private

  def addButtonItem
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(
      UIBarButtonSystemItemAdd, target:self, action:'addItem')
  end

  def reuseable_cell(cell_id=nil)
    cell_id ||= self.class.name
    tableView.dequeueReusableCellWithIdentifier(cell_id) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:cell_id)
  end

  def store
    WidgetStore.shared_store
  end
end

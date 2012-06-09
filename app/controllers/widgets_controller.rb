class WidgetsController < UITableViewController
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = reuseable_cell
    item = Widget.all[indexPath.row]
    cell.textLabel.text = item.name
    cell.detailTextLabel.text = item.created_at.to_s
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    selected_item = Widget.item_at_index(indexPath.row)
    puts "selected! #{selected_item}"
    viewItem selected_item
  end

  def viewDidLoad
    self.title = "Wigets"
    action = 'add'
    navigationItem.rightBarButtonItem = addButtonItem
    self.navigationItem.leftBarButtonItem = self.editButtonItem
  end

  def tableView(tableView, numberOfRowsInSection:section)
    Widget.count
  end

  def addItem
    controller = WidgetDetailController.alloc.init
    completion = lambda {}
    self.presentViewController(controller, animated:true, completion:completion)
  end

  def viewItem(item)
    controller = WidgetDetailController.alloc.init
    controller.item = item
    completion = lambda {}
    self.presentViewController(controller, animated:true, completion:completion)
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
end

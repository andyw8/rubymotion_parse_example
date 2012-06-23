class WidgetsController < PFQueryTableViewController
  include SignupViewControllerDelegate
  include DisplaysLoginController
  include ControllerOperations::Add
  include ControllerOperations::Show
  include ReuseableCell

  def initWithStyle(style)
    super.tap do |vc|
      vc.className = "Widget"
      vc.textKey = "name"
      vc.pullToRefreshEnabled = true
      vc.paginationEnabled = false
    end
  end

  def viewDidLoad
    super
    self.clearsSelectionOnViewWillAppear = false
    self.title = "Widgets"
    navigationItem.rightBarButtonItem = addButtonItem
    navigationItem.leftBarButtonItem = self.editButtonItem
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    # We only care about deletion, so need to check editingStyle
    object_to_delete = self.objectAtIndex(indexPath)
    block = lambda do |result, error|
      loadObjects
    end
    object_to_delete.deleteInBackgroundWithBlock(block)
    self.objects.delete object_to_delete
    self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    show model_class.item_at_index(indexPath.row)
  end

  def detail_controller
    WidgetDetailController.alloc.init
  end

  def model_class
    Widget
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath, object:object)
    reuseable_cell.tap do |cell|
      cell.textLabel.text = object.objectForKey("name") # TODO reuse from above?
    end
  end
end

class WidgetsController < PFQueryTableViewController
  include SignupViewControllerDelegate
  include DisplaysLoginController
  include ControllerOperations::Add
  include ControllerOperations::Show
  include ReuseableCell

  def initWithStyle(style)
    super.tap do |view_controller|
      view_controller.className = "Widget"
      view_controller.pullToRefreshEnabled = true
      view_controller.paginationEnabled = false
    end
  end

  def viewDidLoad
    super
    # TODO better to have a current_user object?
    display_login_controller unless User.signed_in?
    self.clearsSelectionOnViewWillAppear = false
    self.title = "Widgets"
    navigationItem.rightBarButtonItem = addButtonItem
    navigationItem.leftBarButtonItem = self.editButtonItem
  end

  def tableView(tableView, commitEditingStyle:editingstyle, forRowAtIndexPath:indexPath)
    # We only care about deletion, so no need to check editingStyle
    object_to_delete = objectAtIndex(indexPath)
    object_to_delete.deleteInBackground
    objects.delete object_to_delete
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    show self.objectAtIndex(indexPath)
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath, object:object)
    reuseable_cell(style: UITableViewCellStyleSubtitle).tap do |cell|
      cell.textLabel.text = object.objectForKey("name") # TODO reuse from above?
      cell.detailTextLabel.text = object.createdAt.to_s
    end
  end
end
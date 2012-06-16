class WidgetsController < UITableViewController
  include SignupViewControllerDelegate

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
    selected_item = Widget.item_at_index(indexPath.row)
    if editingStyle == UITableViewCellEditingStyleDelete
      selected_item.delete
      Widget.expire_cache
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
      self.tableView.reloadData
    end
  end

  def viewDidLoad
    self.title = "Wigets"
    navigationItem.rightBarButtonItem = addButtonItem
    navigationItem.leftBarButtonItem = self.editButtonItem
    display_login_controller
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
    self.presentViewController(controller, animated:true, completion:nil)
  end

  def viewItem(item)
    controller = WidgetDetailController.alloc.init
    controller.item = item
    controller.dismiss_block = lambda do
      Widget.expire_cache
      self.tableView.reloadData
    end
    presentViewController(controller, animated:true, completion:nil)
  end

  private

  def display_login_controller
    options = PFLogInFieldsUsernameAndPassword |
      PFLogInFieldsLogInButton |
      PFLogInFieldsSignUpButton |
      PFLogInFieldsPasswordForgotten |
      PFLogInFieldsFacebook |
      PFLogInFieldsTwitter |
      PFLogInFieldsDismissButton

    login_controller = PFLogInViewController.alloc.init.tap do |lc|
      lc.delegate = self
      lc.fields = options
    end

    presentViewController(login_controller, animated:true, completion:nil)
  end

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

class ParseTableViewController < UITableViewController
  def title
    self.class.name.gsub('Controller', '')
  end

  def viewDidLoad
    self.title = title
    action = 'add'
    navigationItem.rightBarButtonItem = addButtonItem
    self.navigationItem.leftBarButtonItem = self.editButtonItem
  end

  def tableView(tableView, numberOfRowsInSection:section)
    data_source.count
  end

  def addItem
    controller = AddWidgetController.alloc.init
    self.presentViewController(controller, animated:true, completion:nil)
  end

  def reuseable_cell(cell_id=nil)
    cell_id ||= self.class.name
    tableView.dequeueReusableCellWithIdentifier(cell_id) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:cell_id)
  end

  private

  def addButtonItem
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(
      UIBarButtonSystemItemAdd, target:self, action:'addItem')
  end
end

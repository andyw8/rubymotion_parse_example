class WidgetDetailController < UIViewController
  attr_writer :item
  attr_writer :dismiss_block

  def parse_class
    Widget
  end

  def loadView
    widget_detail_view = WidgetDetailView.alloc.init
    # TODO do this within the view?
    widget_detail_view.backgroundColor = UIColor.groupTableViewBackgroundColor
    # TODO is this a sensible approach?
    widget_detail_view.delegate = self
    widget_detail_view.item = @item
    self.view = widget_detail_view
    if @item
      self.title = "Edit Widget"
    else
      self.title = "New Widget"
    end
  end

  #def viewDidLoad
    #self.title = "Detail"
    #self.toolbarItems = [UIBarButtonSystemItemDone]
    #action = 'add'
    #navigationItem.rightBarButtonItem = UIBarButtonSystemItemDone
    #self.navigationItem.leftBarButtonItem = self.editButtonItem
  #end

  def create_action
    WidgetStore.shared_store.create('name' => self.view.name_text_field.text)
    #@objectid_value_label.text = widget.object_id
    # automatically gets forwarded to presenting view controller
    self.presentingViewController.dismissViewControllerAnimated(true, completion:@dismiss_block)
  end
end

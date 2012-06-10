class WidgetDetailController < UIViewController
  attr_writer :item
  attr_writer :dismiss_block

  def parse_class
    Widget
  end

  def loadView
    # http://cps.liridesce.com/?p=100
    super
    button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone,
                     target:self,
                     action:'done')
  self.navigationItem.setRightBarButtonItem(button)
  #[button release];
 
  frame = self.view.bounds
 
  navBar = UINavigationBar.alloc.initWithFrame(frame)
  frame.size = navBar.sizeThatFits(frame.size)
  navBar.setFrame(frame)
  navBar.setAutoresizingMask(UIViewAutoresizingFlexibleWidth)
  navBar.setItems([self.navigationItem])
 
  self.view.addSubview(navBar)
 
 # http://stackoverflow.com/questions/1492852/add-toolbar-to-uitableviewcontroller

  navHeight = 44 # TODO this is a guess

  detail_view = WidgetDetailView.alloc.initWithFrame(CGRectMake(0,
    navHeight,
    self.view.bounds.size.width,
    self.view.bounds.size.height-navHeight))
    # # TODO do this within the view?
    detail_view.backgroundColor = UIColor.groupTableViewBackgroundColor
    # # TODO is this a sensible approach?
    detail_view.delegate = self
    detail_view.item = @item
    # self.view = widget_detail_view
     if @item
       self.title = "Edit Widget"
     else
       self.title = "New Widget"
     end
    self.view.addSubview detail_view
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

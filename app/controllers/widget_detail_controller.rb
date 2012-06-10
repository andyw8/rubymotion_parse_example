class WidgetDetailController < UIViewController
  include Buttons

  attr_writer :item
  attr_writer :dismiss_block

  def parse_class
    Widget
  end

  def loadView
    # Based on code from http://cps.liridesce.com/?p=100
    super

    self.navigationItem.setRightBarButtonItem(done_button)
    self.navigationItem.setLeftBarButtonItem(cancel_button)
   
    frame = self.view.bounds
   
    navBar = UINavigationBar.alloc.initWithFrame(frame)
    frame.size = navBar.sizeThatFits(frame.size)
    navBar.frame = frame
    navBar.autoresizingMask = UIViewAutoresizingFlexibleWidth
    navBar.items = [self.navigationItem]
   
    self.view.addSubview(navBar)

    navHeight = navBar.frame.size.height

    detail_view = WidgetDetailView.alloc.initWithFrame([
      [0, navHeight],
      [self.view.bounds.size.width, self.view.bounds.size.height-navHeight]
    ])
    detail_view.backgroundColor = UIColor.groupTableViewBackgroundColor
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

  def cancel_action
    self.presentingViewController.dismissViewControllerAnimated(true, completion:lambda {})
  end

  def done_action
    WidgetStore.shared_store.create('name' => self.view.name_text_field.text)
    #@objectid_value_label.text = widget.object_id
    # automatically gets forwarded to presenting view controller
    self.presentingViewController.dismissViewControllerAnimated(true, completion:@dismiss_block)
  end
end

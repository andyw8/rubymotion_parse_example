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
    set_buttons
    add_nav_bar
    add_detail_view
    set_title
  end

  def cancel_action
    dismissViewControllerAnimated(true, completion:nil)
  end

  def done_action
    if @item
      @item.name = @detail_view.name_text_field.text
      @item.save
    else
      store.create('name' => @detail_view.name_text_field.text)
    end
    dismissViewControllerAnimated(true, completion:@dismiss_block)
  end

  private

  def set_buttons
    self.navigationItem.setRightBarButtonItem done_button
    self.navigationItem.setLeftBarButtonItem cancel_button
  end

  def add_nav_bar
    frame = self.view.bounds
    @nav_bar = UINavigationBar.alloc.initWithFrame(frame)
    frame.size = @nav_bar.sizeThatFits(frame.size)
    @nav_bar.frame = frame
    @nav_bar.autoresizingMask = UIViewAutoresizingFlexibleWidth
    @nav_bar.items = [self.navigationItem]
    self.view.addSubview(@nav_bar)
  end

  def add_detail_view
    nav_height = @nav_bar.frame.size.height
    view_size = self.view.bounds.size

    @detail_view = WidgetDetailView.alloc.initWithFrame([
      [0, nav_height],
      [view_size.width, view_size.height - nav_height]
    ])
    @detail_view.backgroundColor = UIColor.groupTableViewBackgroundColor
    @detail_view.delegate = self

    @detail_view.item = @item
    self.view.addSubview @detail_view
  end

  def name_field_changed(sender)
    done_button.enabled = sender.text != ''
  end

  def viewDidLoad
    done_button.enabled = false
    @detail_view.name_text_field.addTarget(self, action:'name_field_changed:', forControlEvents:UIControlEventEditingChanged)
  end

  def set_title
    if @item
      self.title = "Edit Widget"
    else
      self.title = "New Widget"
    end
  end

  private

  def store
    WidgetStore.shared_store
  end
end

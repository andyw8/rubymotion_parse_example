class WidgetDetailView < UIView
  def drawRect(rect)
    name_text_field = UITextField.alloc.initWithFrame([[20, 80], [280,30]])
    name_text_field.text = "hello world"
    name_text_field.borderStyle = UITextBorderStyleBezel
    name_text_field.backgroundColor = UIColor.whiteColor
    addSubview name_text_field

    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle("Create Widget", forState:UIControlStateNormal)
    button.frame = [[50, 210], [200, 30]]
    button.addTarget self, action:'handle_add_action', forControlEvents:UIControlEventTouchUpInside
    addSubview button
  end

  def handle_add_action
    widget = Widget.create('foo' => 'bar2')
    #@objectid_value_label.text = widget.object_id
    UIApplication.sharedApplication.delegate.nav.popViewControllerAnimated:YES
  end
end

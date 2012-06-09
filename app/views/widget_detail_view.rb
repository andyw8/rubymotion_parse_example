class WidgetDetailView < UIView

  attr_writer :item
  attr_writer :delegate
  attr_reader :name_text_field

  def drawRect(rect)
    @name_text_field = UITextField.alloc.initWithFrame([[20, 80], [280,30]])
    @name_text_field.borderStyle = UITextBorderStyleBezel
    @name_text_field.backgroundColor = UIColor.whiteColor
    addSubview @name_text_field

    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle("Create Widget", forState:UIControlStateNormal)
    button.frame = [[50, 210], [200, 30]]
    button.addTarget @delegate, action:'create_action', forControlEvents:UIControlEventTouchUpInside
    addSubview button

    if @item
      @name_text_field.text = @item.name
    end
  end
end

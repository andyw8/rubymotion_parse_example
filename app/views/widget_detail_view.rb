class WidgetDetailView < UIView

  attr_writer :item
  attr_writer :delegate
  attr_reader :name_text_field

  def drawRect(rect)
    name_text_field.borderStyle = UITextBorderStyleBezel
    name_text_field.backgroundColor = UIColor.whiteColor
    addSubview @name_text_field
    name_text_field.delegate = @delegate
    name_text_field.becomeFirstResponder

    if @item
      @name_text_field.text = @item['name'] # TODO add .name method?
    end
  end

  def name_text_field
    @name_text_field ||= UITextField.alloc.initWithFrame([[20, 80], [280,30]])
  end

end

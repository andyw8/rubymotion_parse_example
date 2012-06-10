module Buttons
  def done_button
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone,
      target:self, action:'done_action')
  end

  def cancel_button
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCancel,
     target:self, action:'cancel_action')
  end
end
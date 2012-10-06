class WidgetDetailController < Formotion::FormController
  def initWithItem(item)
    @item = item
    init
  end

  def init
    form = Formotion::Form.new
    form.build_section do |section|
      section.title = "Name"
      section.build_row do |row|
        row.key = :name
        row.type = :string
        row.value = @item['name'] if @item
      end
    end
    form.on_submit do
      self.submit
    end
    super.initWithForm(form)
  end

  def viewDidLoad
    super
    if @item.nil?
      self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'submit')
    end
  end

  def submit
    w = Widget.new # TODO can I use .new(name: ...) here?
    w.name = form.render[:name]
    w.saveEventually
    parentViewController.dismissModalViewControllerAnimated(true)
  end
end
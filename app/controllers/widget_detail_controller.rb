class WidgetDetailController < Formotion::FormController
  def initWithItem(item, opts = {})
    @editing = true if opts[:edit]
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
      if @item
        update
      else
        create
      end
    end
    super.initWithForm(form)
  end

  def viewDidLoad
    super
    if @item
      title = "Show Widget"
      navigationItem.rightBarButtonItem = self.editButtonItem
    else
      title = "New Widget"
      navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'create')
    end
  end

  def setEditing(editing, animated:animated)
    self.title = "Editing!"
  end

  def update
    @item.name = form.render[:name]
    @item.saveEventually
    parentViewController.dismissModalViewControllerAnimated(true)
  end

  def create
    widget = Widget.new(name: form.render[:name])
    widget.saveEventually
    parentViewController.dismissModalViewControllerAnimated(true)
  end
end
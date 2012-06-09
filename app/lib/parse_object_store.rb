class ParseObjectStore
  attr_reader :items

  def self.shared_store
    @@shared_store ||= new
  end

  def initialize
    @items = []
  end

  def delete_item_at_index(index)
    @items.delete_at(index)
  end

  def all
    @all ||= begin
      query = PFQuery.queryWithClassName(item_class.name)
      result = query.findObjects
      result.map {|r| item_class.instantiate(r) } # TODO parse_class
    end
  end

  def count
    all.size
  end

  def create(params)
    object = item_class.new
    params.map { |key, value| object[key] = value }
    object.save
    object
  end

  def expire_cache
    @all = nil
  end

  private

  def item_class
    raise "Abstract method called"
  end

end
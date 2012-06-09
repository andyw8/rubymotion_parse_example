class ParseObjectStore
  #include Singleton

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
      query = PFQuery.queryWithClassName('Widget') # parse_class.name
      result = query.findObjects
      result.map {|r| Widget.instantiate(r) } # TODO parse_class
    end
  end

  def count
    all.size
  end

  def create(params)
    object = parse_class.new
    params.map { |key, value| object[key] = value }
    object.save
    object
  end

  def expire_cache
    @all = nil
  end

  private

  def parse_class
    raise "Abstract method called"
  end

end
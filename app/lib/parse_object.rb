class ParseObject
  attr_accessor :object # is this bad?

  def initialize(params={})
    @object = PFObject.objectWithClassName(self.class.name)
    params.map { |key, value| object[key] = value }
  end

  def []=(key, value)
    @object[key] = value
  end

  def save
    @object.save
  end

  def object_id
    @object.objectId
  end

  def self.item_at_index(index)
    store.all[index]
  end

  def name
    @object['name'] || @object['title'] || 'Untitled'
  end

  def created_at
    @object.createdAt
  end

  def updated_at
    @object.updatedAt
  end

  def to_s
    "#<#{self.class.name} object_id:#{object_id}>"
  end

  # TODO where does this belong?
  def self.instantiate(object)
    parse_object = new
    parse_object.object = object
    parse_object
  end

  def self.expire_cache
    store.expire_cache
  end

  private

  def store
    raise "Abstract method called"
  end
end

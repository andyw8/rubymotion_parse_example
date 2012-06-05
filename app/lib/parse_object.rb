class ParseObject
  attr_accessor :object # is this bad?

  def self.parse_class_name
    'Widget' # TODO how to get this automatically?
  end

  def initialize(params={})
    @object = PFObject.objectWithClassName(ParseObject.parse_class_name)
    params.map { |key, value| object[key] = value }
  end

  def self.instantiate(object)
    parse_object = new
    parse_object.object = object
    parse_object
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

  def self.count
    Widget.all.size # TODO fix this
  end

  def self.create(params)
    object = new
    params.map { |key, value| object[key] = value }
    object.save
    object
  end

  def self.all
    @all ||= begin
      query = PFQuery.queryWithClassName(self.parse_class_name)
      result = query.findObjects
      result.map {|r| self.instantiate(r) }
    end
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
end

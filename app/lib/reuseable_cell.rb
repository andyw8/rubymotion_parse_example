module ReuseableCell
  def reuseable_cell(opts={})
    style = opts[:style] || UITableViewCellStyleDefault
    reuse_identifier = opts[:identifier] || self.className + "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(reuse_identifier)
    unless cell
      cell = PFTableViewCell.alloc.initWithStyle(style, reuseIdentifier:reuse_identifier)
    end
    cell
  end
end

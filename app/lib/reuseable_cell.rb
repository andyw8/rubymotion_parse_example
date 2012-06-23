module ReuseableCell
  def reuseable_cell
    identifier = self.className + "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(identifier)
    unless cell
      cell = PFTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:identifier)
    end
    cell
  end
end

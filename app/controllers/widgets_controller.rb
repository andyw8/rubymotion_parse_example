class WidgetsController < ParseTableViewController
  def data_source
    Widget
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = reuseable_cell
    item = data_source.all[indexPath.row]
    cell.textLabel.text = item.name
    cell.detailTextLabel.text = item.created_at.to_s
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    selected_item = data_source.item_at_index(indexPath.row)
    puts "selected! #{selected_item}"
    editItem selected_item
  end
end

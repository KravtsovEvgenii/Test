import UIKit


class TableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
  
  var onSelectRow: ((ResponseItem) -> Void)?
  
  private var tableView: UITableView
  private var items =  [ResponseItem]()
  
  init(tableView: UITableView) {
    self.tableView = tableView
    super.init()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func loadTable(withResponse response: Response?) {
    guard let response = response else { return }
    self.items = sortItems(response.data, withOrder: response.view)
    tableView.reloadData()
  }
  
  func reloadTable() {
    tableView.reloadData()
  }
  //MARK: Sorting
  private func sortItems(_ items: [ResponseItem], withOrder order: [String]) -> [ResponseItem] {
    var tempItems = items
    var sortedItems = [ResponseItem]()
    for order in order {
      if let item = findItemForOrder(order: order, inItems: &tempItems) {
        sortedItems.append(item)
      }
    }
    if tempItems.count > 0 {
      sortedItems.append(contentsOf: sortItems(tempItems, withOrder: order))
    }
    return sortedItems
  }
  
  private func findItemForOrder(order: String, inItems items: inout [ResponseItem]) -> ResponseItem? {
    for item in items {
      if item.type.rawValue == order {
        items = items.filter({ $0 != item  })
        return item
      }
    }
    return nil
  }
  
  //MARK: TableView Data Source and Delegate
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    switch item.type {
    
    case .hz:
      return makeCell(cellType: HZCell.self,
                      item: item, forIndexPath:
                        indexPath)
    case .picture:
      return makeCell(cellType: PictureCell.self,
                      item: item,
                      forIndexPath: indexPath)
    case .selector:
      return makeCell(cellType: SelectorCell.self,
                      item: item,
                      forIndexPath: indexPath)
    case .unknown:
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    onSelectRow?(item)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let item = items[indexPath.row]
    switch item.type {
    case .picture: return 300
    case .selector, .hz, .unknown: return 100
    }
  }
  
}

extension TableManager {
  func makeCell<T: ConfigurableCell>(
    cellType: T.Type,
    item: ResponseItem?,
    forIndexPath indexPath: IndexPath) -> T {
    
    tableView.register(cellType, forCellReuseIdentifier: cellType.reuseId)
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseId, for: indexPath) as? T else {
      fatalError("Unable to dequeue \(cellType)")
    }
    cell.configure(with: item as! T.CellData)
    return cell
  }
  
}

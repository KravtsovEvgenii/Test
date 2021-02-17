import UIKit

class ListViewController: UIViewController, ViewHolder {
  
  typealias RootViewType = ListView
  
  private var viewModel: ListViewModel
  private lazy var tableManager = TableManager(tableView: rootView.tableView)
  
  init (viewModel: ListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    self.view = RootViewType()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableManager.onSelectRow = { [weak self] item in
      self?.handleSelection(item: item)
    }
    
    viewModel.getData(completion: reloadTable)
  }
  
  private func reloadTable(_ response: Response?) {
    tableManager.loadTable(withResponse: response)
  }
  
  private func handleSelection(item: ResponseItem) {
    switch item.type {
    
    case .hz, .picture:
      showAlert(withTitle: "Choosed",
                withMessage: item.name)
    case .selector:
      showSelection(forItem: item) { [weak self] index in
        item.data.selectedID = index
        self?.tableManager.reloadTable()
      }
    case .unknown:
      return 
    }
  }
  
}


import UIKit
import SnapKit

class ListView: UIView {
  
  let headerView = ListHeaderView()
  let tableView = UITableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    addSubview(headerView)
    headerView.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(40)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(60)
    }
    
    addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.top.equalTo(headerView.snp.bottom)
      make.bottom.leading.trailing.equalToSuperview()
    }
  }
  
}

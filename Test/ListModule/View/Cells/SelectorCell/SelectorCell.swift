import UIKit

class SelectorCell: UITableViewCell, ConfigurableCell {
  
  private let cellView = SelectorCellView()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    selectionStyle = .none
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    addSubview(cellView)
    cellView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func configure(with data: ResponseItem) {
    cellView.configure(withData: data)
  }
  
}

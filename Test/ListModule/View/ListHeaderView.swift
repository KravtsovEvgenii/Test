import UIKit
import SnapKit

class ListHeaderView: UIView {
  let titleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupLabel()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(4)
      make.leading.trailing.equalToSuperview()
    }
  }
  
  private func setupLabel() {
    titleLabel.text = "Test"
    titleLabel.font = UIFont.systemFont(ofSize: 32)
    titleLabel.textAlignment = .center
    titleLabel.textColor = .black
  }
  
}

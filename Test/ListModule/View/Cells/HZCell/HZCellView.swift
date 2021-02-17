import UIKit

class HZCellView: UIView {
  
  private let titleLabel = UILabel()
  private let textLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLabels()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(8)
    }
    
    addSubview(textLabel)
    textLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(8)
      make.leading.equalToSuperview().inset(8)
    }
  }
  
  private func setupLabels() {
    textLabel.textColor = .black
    textLabel.font = UIFont.systemFont(ofSize: 16)
    
    titleLabel.textColor = .black
    titleLabel.font = UIFont.systemFont(ofSize: 18)
  }
  
  func configure(withData data: ResponseItem) {
    titleLabel.text = data.name
    textLabel.text = data.data.text
  }
  
}

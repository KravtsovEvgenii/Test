import UIKit


class SelectorCellView: UIView {
  
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
    let id = data.data.selectedID ?? 1
    titleLabel.text = "\(data.name), selectedID: \(id)"
    textLabel.text = getTextForVariat(variants: data.data.variants ?? [], id: id)
  }
  
  private func getTextForVariat(variants: [Variant], id: Int) -> String? {
    return variants.filter({ $0.id == id }).first?.text
  }
  
}

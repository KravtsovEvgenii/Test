import UIKit
import SDWebImage
import SnapKit

class PictureCellView: UIView {
  
  private let titleLabel = UILabel()
  private let textLabel = UILabel()
  private let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupElements()
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
    
    addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(4)
      make.bottom.leading.trailing.equalToSuperview().inset(8)
    }
  }
  
  private func setupElements() {
    textLabel.textColor = .black
    textLabel.font = UIFont.systemFont(ofSize: 16)
    
    titleLabel.textColor = .black
    titleLabel.font = UIFont.systemFont(ofSize: 18)
    
    imageView.contentMode = .scaleAspectFit
  }
  
  func configure(withData data: ResponseItem) {
    titleLabel.text = data.name
    textLabel.text = data.data.text
    imageView.sd_setImage(
      with: URL(string: data.data.url!),
      completed: nil)
  }
  
}

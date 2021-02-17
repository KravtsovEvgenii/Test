import UIKit

public protocol ConfigurableCell: class {
  
  associatedtype CellData: Equatable
  
  static var reuseId: String { get }
  
  var cellType: AnyClass { get }
  
  func configure(with data: CellData)
}

public extension ConfigurableCell {
  
  var cellType: AnyClass {
    return type(of: self)
  }
  
  static var reuseId: String {
    return String(describing: self)
  }
  
}


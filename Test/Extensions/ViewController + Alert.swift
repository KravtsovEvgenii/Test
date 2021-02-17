import UIKit

extension UIViewController {
  
  func showAlert(withTitle title: String, withMessage message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertController.addAction(action)
    present(alertController, animated: true, completion: nil)
  }
  
  func showSelection(forItem item: ResponseItem, closure: @escaping (Int) -> Void) {
    let alertController = UIAlertController(title: "Choose Option", message: "", preferredStyle: .actionSheet)
    item.data.variants?.forEach { option in
      let alert = UIAlertAction(title: option.text, style: .default) { _ in
        closure(option.id)
      }
      alertController.addAction(alert)
    }
    let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
    alertController.addAction(cancel)
    present(alertController, animated: true, completion: nil)
  }
  
}

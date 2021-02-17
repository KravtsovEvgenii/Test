import Foundation

enum ContentType : String, Codable {
  case hz, picture, selector, unknown
}

// MARK: - Response
class Response: Codable {
  let data: [ResponseItem]
  let view: [String]
}

// MARK: - ResponseData
class ResponseItem: Codable, Equatable {
  
  let name: String
  var data: ItemData
  var type: ContentType {
    return ContentType(rawValue: name) ?? .unknown
  }
  
  static func == (lhs: ResponseItem, rhs: ResponseItem) -> Bool {
    return lhs.data == rhs.data
  }
}

class ItemData: Codable, Equatable {
  
  let text: String?
  let url: String?
  var selectedID: Int?
  let variants: [Variant]?
  
  enum CodingKeys: String, CodingKey {
    case text, url
    case selectedID = "selectedId"
    case variants
  }
  
  static func == (lhs: ItemData, rhs: ItemData) -> Bool {
    return lhs.url == rhs.url && lhs.text == rhs.text
  }
  
}
// MARK: - Variant
class Variant: Codable {
  let id: Int
  let text: String
}

import Foundation

protocol DataFetcher {
  func getData(response: @escaping (Response?)->Void)
}

class NetworkDataFetcher: DataFetcher{
  
  private let networking: Networking
  
  init(networking: Networking = NetworkService()) {
    self.networking = networking
  }
  
  func getData(response: @escaping (Response?)->Void) {
    networking.request(fromPath: API.baseURL) { (data, error) in
      if let error = error {
        print("Error received requesting data: \(error.localizedDescription)")
        response(nil)
      }
      let decoded = self.parseJSON(type: Response.self, data: data)
      response(decoded)
    }
  }
  
  private func parseJSON<T: Decodable>(type: T.Type, data: Data?)-> T?{
    let jsonDecoder = JSONDecoder()
    guard let data = data else { return nil }
    
    do {
      let decoded = try jsonDecoder.decode(type.self, from: data)
      
      return decoded
    } catch let error {
      print(error.localizedDescription)
    }
    return nil
  }
}

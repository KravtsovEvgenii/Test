import Foundation

protocol Networking {
  func request(fromPath path: String, completion: @escaping (Data?,Error?)->Void)
}

final class NetworkService: Networking {
  
  func request(fromPath path: String, completion: @escaping (Data?, Error?) -> Void) {
    
    if let url = URL(string: path){
      let request = URLRequest(url: url)
      let task = createDataTask(fromRequest: request, completion: completion)
      task.resume()
    }
  }
  private func createDataTask(fromRequest request: URLRequest, completion: @escaping (Data?,Error?)->Void)->URLSessionDataTask {
    
    return URLSession.shared.dataTask(with: request) { (data, response, error) in
      
      DispatchQueue.main.async {
        completion(data,error)
        
      }
    }
  }
  
}


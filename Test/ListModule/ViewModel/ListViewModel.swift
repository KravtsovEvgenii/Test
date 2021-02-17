import Foundation

class ListViewModel {
  
  private var dataFetcher: DataFetcher
  
  init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
    self.dataFetcher = dataFetcher
  }
  
  func getData(completion: @escaping (Response?) -> Void) {
    dataFetcher.getData(response: completion)
  }
  
}


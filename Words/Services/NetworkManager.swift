//
//  NetworkManager.swift
//  Words
//
//  Created by Владимир Файб on 25.03.2022.
//

import Foundation

class NetworkManager {
  static let shared = NetworkManager()
  
  private init() {}
  
  func getAlias(index: Int, completion: @escaping (Alias?) -> Void) {
    let urlString = "https://ilines.ru/json/alias/\(index)"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil, let data = data else {
        completion(nil)
        return
      }
      let alias = try? JSONDecoder().decode(Alias.self, from: data)
      if let alias = alias {
        completion(alias)
      } else {
        completion(nil)
      }
    }.resume()
  }
}

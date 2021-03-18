//
//  NetworkManager.swift
//  Articles
//
//  Created by Idan Moshe on 18/03/2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(_ handler: @escaping (Articles?) -> Void) {
        URLSession.shared.dataTask(with: Application.URLs.articles) { (data: Data?, response: URLResponse?, error: Error?) in
            func callback(_ articles: Articles?) {
                DispatchQueue.main.async {
                    handler(articles)
                }
            }
            
            if let error: Error = error {
                debugPrint(#file, #function, error)
                callback(nil)
                return
            }
            
            guard let jsonData: Data = data else {
                callback(nil)
                return
            }
            
            let articles = try? JSONDecoder().decode(Articles.self, from: jsonData)
            callback(articles)
        }.resume()
    }
    
}

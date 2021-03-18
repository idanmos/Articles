//
//  ArticlesViewModel.swift
//  Articles
//
//  Created by Idan Moshe on 18/03/2021.
//

import UIKit

class ArticlesViewModel {
    
    // MARK: - Lifecycle
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    deinit {
        debugPrint("Deallocating \(self)")
        self.articles.removeAll()
    }
    
    // MARK: - Variables
    
    private var networkManager: NetworkManager
    var articles: [Datum] = []
    
    // MARK: - General Methods
    
    func fetchData(_ handler: @escaping () -> Void) {
        self.articles.removeAll()
        
        self.networkManager.fetchData { (articles: Articles?) in
            if let articles: Articles = articles, !articles.data.isEmpty {
                self.articles.append(contentsOf: articles.data)
            }
            DispatchQueue.main.async {
                handler()
            }
        }
    }
    
}

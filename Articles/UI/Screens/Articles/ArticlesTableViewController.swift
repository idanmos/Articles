//
//  ArticlesTableViewController.swift
//  Articles
//
//  Created by Idan Moshe on 18/03/2021.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    
    // MARK: - Variables
    
    private let viewModel = ArticlesViewModel(networkManager: .shared)
    
    private lazy var progressView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    deinit {
        debugPrint("Deallocating \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.progressView)
        self.view.bringSubviewToFront(self.progressView)
        self.progressView.startAnimating()
        
        NSLayoutConstraint.activate([
            self.progressView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.tableView.register(ArticleTableViewCell.self)
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        self.viewModel.fetchData {
            self.progressView.stopAnimating()
            self.progressView.removeFromSuperview()
            
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ArticleTableViewCell.self, indexPath: indexPath)
        let article: Datum = self.viewModel.articles[indexPath.row]
        cell.configure(article)
        return cell
    }

}

//
//  View.swift
//  NewsApp-VIPER
//
//  Created by max on 23.02.2022.
//

import Foundation

import UIKit
import SafariServices

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [Article])
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    
    
    var presenter: AnyPresenter?
    
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableview.isHidden = true
        return tableview
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    var news: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(label)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    
    func update(with news: [Article]) {
        print ("Got users")
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update(with error: String) {
        print (error)
        DispatchQueue.main.async {
            self.news = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
        }
    }
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.title.text = news[indexPath.row].title
        cell.subtitle.text = news[indexPath.row].description
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let image = self.getImage(from: self.news[indexPath.row].urlToImage) {
                DispatchQueue.main.async {
                    cell.newsImage.image = UIImage(data: image)
                }
            }
        }
        cell.counterLabel.text = (String(describing: news[indexPath.row].countOfViews))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = news[indexPath.row]
        if let url = item.url {
            let config = SFSafariViewController.Configuration()
            guard let url = URL(string: url) else { return }
            let safariVC = SFSafariViewController(url: url, configuration: config)
            safariVC.modalPresentationStyle = .automatic
            present(safariVC, animated: true, completion: nil)
        }
    }
}

extension UserViewController {
    
    private func getImage(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
    
}

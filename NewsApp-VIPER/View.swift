//
//  View.swift
//  NewsApp-VIPER
//
//  Created by max on 23.02.2022.
//

import Foundation

import UIKit

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
    
    var users: [Article] = []
    
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
    
    func update(with users: [Article]) {
        print ("Got users")
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update(with error: String) {
        print (error)
        DispatchQueue.main.async {
            self.users = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
        }
    }
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { fatalError()}
        cell.title.text = users[indexPath.row].title
        cell.subtitle.text = users[indexPath.row].description
        if let image = getImage(from: users[indexPath.row].urlToImage) {
            cell.newsImage.image = UIImage(data: image)
        }
        cell.counterLabel.text = (String(describing: users[indexPath.row].countOfViews))
        
        
        
        return cell
    }
}

extension UserViewController {
    
    private func getImage(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
    
}

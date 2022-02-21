//
//  NewsListTableViewController.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import UIKit

protocol NewsListViewInputProtocol: AnyObject {
    func reloadData (for section: NewsSectionViewModel)
}

protocol NewsListViewOutputProtocol: AnyObject {
    init(view: NewsListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class NewsListTableViewController: UITableViewController {
    
    private var section: SectionRowRepresentable = NewsSectionViewModel()
    private let configurator: NewsListConfiguratorInputProtocol = NewsListConfigurator()
    
    var presenter: NewsListViewOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}

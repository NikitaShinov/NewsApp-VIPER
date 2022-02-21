//
//  NewsListRouter.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

protocol NewsListRouterInputprotocol {
    init(viewController: NewsListTableViewController)
    func openDetailsViewController()
}

class NewsListRouter: NewsListRouterInputprotocol {
    unowned let viewController: NewsListTableViewController
    
    required init(viewController: NewsListTableViewController) {
        self.viewController = viewController
    }
    func openDetailsViewController() {
    }
}

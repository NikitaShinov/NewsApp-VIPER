//
//  NewsListConfigurator.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import Foundation

protocol NewsListConfiguratorInputProtocol {
    func configure(with viewController: NewsListTableViewController)
}

class NewsListConfigurator: NewsListConfiguratorInputProtocol {
    func configure(with viewController: NewsListTableViewController) {
        let presenter = NewsListPresenter(view: viewController)
        let interactor = NewsListInteractor(presenter: presenter)
        let router = NewsListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}

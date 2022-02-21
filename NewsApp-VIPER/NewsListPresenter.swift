//
//  NewsListPresenter.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import Foundation

class NewsListPresenter: NewsListViewOutputProtocol {
    
    unowned let view: NewsListViewInputProtocol
    var interactor: NewsListInteractorInputProtocol!
    var router: NewsListRouterInputprotocol!
    
    required init(view: NewsListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchNews()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getArticle(at: indexPath)
    }
}

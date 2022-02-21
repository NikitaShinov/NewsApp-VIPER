//
//  NewsListInteractor.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import Foundation

protocol NewsListInteractorInputProtocol: AnyObject {
    init(presenter: NewsListInteractorOutputProtocol)
    func fetchNews()
    func getArticle(at indexPath: IndexPath)
}

protocol NewsListInteractorOutputProtocol: AnyObject {
    func newsDidReceive(_ news: [Article])
    func articleDidReceive(_ article: Article)
}

class NewsListInteractor: NewsListInteractorInputProtocol {
    
    unowned let presenter: NewsListInteractorOutputProtocol
    
    required init(presenter: NewsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    var newsArray: [Article] = []
    func fetchNews() {
        APICaller.shared.getNews { [weak self] result in
            switch result {
            case .success(let news):
                guard let news = news else { return }
                self?.newsArray = news
            case .failure(let error):
                print (error)
            }
        }
    }
    
    func getArticle(at indexPath: IndexPath) {
        let article = DataManager.shared.getAricle(at: indexPath)
        presenter.articleDidReceive(article)
    }
    
}

//
//  Presenter.swift
//  NewsApp-VIPER
//
//  Created by max on 23.02.2022.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[Article], Error>)
}

class UserPresenter: AnyPresenter {
    
    
    
    
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getNews()
        }
    }
    
    var view: AnyView?

    func interactorDidFetchUsers(with result: Result<[Article], Error>) {
        switch result {
        case .success(let news):
            view?.update(with: news)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}

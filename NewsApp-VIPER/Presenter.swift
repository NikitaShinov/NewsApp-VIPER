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
//    func interactorDidFetchImage(with data: Data?, for indexPath: IndexPath)
}

class UserPresenter: AnyPresenter {
    
    
    
    
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?

    func interactorDidFetchUsers(with result: Result<[Article], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
    
//    func interactorDidFetchImage(with data: Data?, for indexPath: IndexPath) {
//        guard let data = data else { return }
//
//    }
}

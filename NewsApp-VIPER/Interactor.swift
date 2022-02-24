//
//  Interactor.swift
//  NewsApp-VIPER
//
//  Created by max on 23.02.2022.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
//    func getImages(from url: URL?, for indexPath: IndexPath) -> Data?
}

class UserInteractor: AnyInteractor {

    
    var presenter: AnyPresenter?
    
    func getUsers() {
        print ("Start fetching")
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=5b857b468411402e93e521c8ccfe22e0") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode(Response.self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities.articles))
//                self?.presenter?.interactorDidFetchImage(with: data)
            } catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }

        }
        task.resume()
    }
    
//    func getImages(from url: URL?, for indexPath: IndexPath) -> Data? {
//        guard let url = url else { return nil }
//        guard let imageData = try? Data(contentsOf: url) else { return nil }
//        self.presenter?.interactorDidFetchImage(with: imageData, for: indexPath)
//        return imageData
//    }

    
}

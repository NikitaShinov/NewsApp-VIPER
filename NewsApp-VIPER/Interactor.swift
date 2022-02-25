//
//  Interactor.swift
//  NewsApp-VIPER
//
//  Created by max on 23.02.2022.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getNews()
}

class UserInteractor: AnyInteractor {

    
    var presenter: AnyPresenter?
    
    func getNews() {
        print ("Start fetching")
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=5b857b468411402e93e521c8ccfe22e0") else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                    print(error.localizedDescription)
                }
            }
            guard let data = data else { return }
            
            let decodedData = try? JSONDecoder().decode(Response.self, from: data)
            if let data = decodedData {
                DispatchQueue.main.async {
                    self?.presenter?.interactorDidFetchUsers(with: .success(data.articles))
                }
            }
        }
        .resume()
    }
    
    
}

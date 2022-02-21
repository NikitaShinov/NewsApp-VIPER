//
//  DataManager.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private var news: [Article] = []
    
    private init() {}
    
    func setNews(_ news: [Article]) {
        self.news = news
    }
    
    func getAricle(at indexPath: IndexPath) -> Article {
        news[indexPath.row]
    }
    
    
}

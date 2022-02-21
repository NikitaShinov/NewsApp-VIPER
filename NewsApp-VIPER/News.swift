//
//  News.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import Foundation

struct Response: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
    let url: String?
    let urlToImage: URL?
    var countOfViews: Int? = 0
}

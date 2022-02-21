//
//  NewsCellViewModel.swift
//  NewsApp-VIPER
//
//  Created by max on 21.02.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIndentifier: String { get }
    var cellHeight: Double { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class NewsCellViewModel: CellIdentifiable {
    
    let title: String
    let subtitle: String
    let url: String
    let imageURL: URL
    
    var cellIndentifier: String {
        "ArticleCell"
    }
    
    var cellHeight: Double {
        120
    }
    
    init(article: Article) {
        title = article.title
        subtitle = article.description ?? ""
        url = article.url ?? ""
        imageURL = article.urlToImage!
    }
}

class NewsSectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}

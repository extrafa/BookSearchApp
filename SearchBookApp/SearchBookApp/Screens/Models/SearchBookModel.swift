//
//  SearchBookModel.swift
//  SearchBookApp
//
//  Created by Ross on 10.04.2025.
//

import Foundation

struct BookSearchResult: Decodable {
    let docs: [Book]
}

struct Book: Identifiable, Decodable {
    var id: String { key }
    let title: String
    let author_name: [String]?
    let key: String
    
}

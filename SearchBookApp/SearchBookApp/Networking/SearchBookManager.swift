//
//  SearchBookManager.swift
//  SearchBookApp
//
//  Created by Ross on 10.04.2025.
//

import Foundation

final class SearchBookManager {
    static let shared = SearchBookManager()
    
    func getBook(query: String) async throws -> [Book] {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://openlibrary.org/search.json?q=\(encodedQuery)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(BookSearchResult.self, from: data).docs
    }
}

enum NetworkError: String, Error {
    case invalidURL = "Invalid url found."
    case invalidResponse = "Invalid response found."
}

//
//  SearchBookViewModel.swift
//  SearchBookApp
//
//  Created by Ross on 10.04.2025.
//

import Foundation

final class SearchBookViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var query: String = ""
    func getBook() async {
        do {
            books = try await SearchBookManager.shared.getBook(query: query)
        } catch {
            print(error.localizedDescription)
        }
    }
}

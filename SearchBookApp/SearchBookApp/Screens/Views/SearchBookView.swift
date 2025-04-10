//
//  SearchBookView.swift
//  SearchBookApp
//
//  Created by Ross on 10.04.2025.
//

import SwiftUI

struct SearchBookView: View {
    @StateObject var searchBookViewModel = SearchBookViewModel()
    var body: some View {
        VStack {
            textFieldBook
            searchBookButton
            listOfSearchedBooks
        }
    }
}

extension SearchBookView {
    var textFieldBook: some View {
        TextField("Search for a book...", text: $searchBookViewModel.query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    var searchBookButton: some View {
        Button {
            Task {
                await searchBookViewModel.getBook()
            }
        } label: {
            Text("SEARCH")
        }
    }
    
    var listOfSearchedBooks: some View {
        List(searchBookViewModel.books) { book in
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.subheadline)
                if let authors = book.author_name {
                    Text(authors.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
}

#Preview {
    SearchBookView()
}

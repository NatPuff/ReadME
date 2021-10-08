//
//  Book.swift
//  ReadME
//
//  Created by AMStudent on 9/2/21.
import Combine

class Song: ObservableObject {
    
    
    let title: String
    let author: String
    @Published var microReview: String
    @Published var readMe: Bool
    
    init(title: String = "Title", author: String = "Author", microReview: String = "", readMe: Bool = true) {
    self.title = title
    self.author = author
    self.microReview = microReview
    self.readMe = readMe
    }
}



extension Song: Hashable, Identifiable {
    func hash(into hasher: inout Hasher){
      hasher.combine(id)
    }
}

extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        lhs === rhs
    }
}

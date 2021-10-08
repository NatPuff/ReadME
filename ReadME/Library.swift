//
//  Library.swift
//  ReadME
//
//  Created by AMStudent on 9/7/21.
//

import Foundation

import class UIKit.UIImage

struct Library {
  var sortedBooks: [Song] { booksCache }

  /// An in-memory cache of the manually-sorted books that are persistently stored.
  private var booksCache: [Song] = [
    .init(title: "Ein Neues Land", author: "Shaun Tan", microReview: "bruh"),
    .init(title: "Bosch", author: "Laurinda Dixon", microReview: "Amogus"),
    .init(title: "Dare to Lead", author: "Brené Brown"),
    .init(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet", microReview: "Cringe"),
    .init(title: "Drinking with the Saints", author: "Michael P. Foley", microReview: "Based"),
    .init(title: "A Guide to Tea", author: "Adagio Teas"),
    .init(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson"),
    .init(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington"),
    .init(title: "How to Draw Cats", author: "Janet Rancan"),
    .init(title: "Drawing People", author: "Barbara Bradley"),
    .init(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter")
  ]
    
    var uiImages:[Song: UIImage] = [:]
}

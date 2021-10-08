//
//  BookViews.swift
//  ReadME
//
//  Created by AMStudent on 9/2/21.
//

import SwiftUI


struct TitleAndAuthorStack: View {
    let book: Song
    let titleFont: Font
    let authorFont: Font
    var body: some View {
        VStack(alignment: .leading){
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
       
    }
}

struct BookmarkButton: View {
   @ObservedObject var book: Song
    
    var body: some View {
      let bookmark = "bookmark"
        
        Button {
            
        } label: {
            Image(systemName: book.readMe ? "\(bookmark).fill" : bookmark)
                .font(.system(size: 48, weight: .light))
        }
    }
}

extension Song {
    struct Image: View {
        let uiImage: UIImage?
        let title: String
        var size:CGFloat?
        let cornerRadius: CGFloat
        var body: some View {
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .cornerRadius(cornerRadius)
            } else{
                let symbol =
                  SwiftUI.Image(title: title)
                  ?? .init(systemName: "book")
                
               symbol
                .resizable()
                .scaledToFit()
                .frame(width: size,height: size)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }
    }
}
}
struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack{
                BookmarkButton(book: .init())
                BookmarkButton(book: .init(readMe: false))
                TitleAndAuthorStack(
                    book: .init(),
                    titleFont: .title,
                    authorFont: .title2
                )
            }
                Song.Image(title: Song().title)
                Song.Image(title: "")
                Song.Image(title: "📖")
            }
            .previewedInAllColorSchemes
        }
    }


extension Image {
    init?(title: String) {
        guard
            let character = title.first,
            case let symbolName = "\(character.lowercased()).square",UIImage(systemName: symbolName) != nil
        else  {
            return nil
        }
        self.init(systemName: symbolName)
    }
}

extension Song.Image {
    init(title: String) {
        self.init(uiImage: nil,
        title: title,
        cornerRadius: .init()
        )
    }
}

extension View {
    var previewedInAllColorSchemes: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}

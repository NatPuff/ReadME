//
//  DetailView.swift
//  ReadME
//
//  Created by AMStudent on 9/7/21.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Song
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    @State var showingAlert = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                BookmarkButton(book: book)
                
                TitleAndAuthorStack(
                    book: book,
                    titleFont: .title,
                    authorFont: .title2)
            }
            VStack {
                Divider()
                    .padding()
                TextField("Review...", text: $book.microReview)
                Song.Image(
                    uiImage: image, 
                    title: book.title,
                    cornerRadius: 16)
                    .scaledToFit()
                HStack {
                    Button("Update Image") {
                        showingImagePicker = true
                    }
                    .padding()
                    Button("Delete Image") {
                        if image != nil{
                            showingAlert = true
                        } else { showingAlert = false
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .alert(isPresented: $showingAlert) {
            .init(title: .init("Delete image for \(book.title)?"), primaryButton: .destructive(.init("Delete")) {
                image = nil
            },
            secondaryButton: .cancel())
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}


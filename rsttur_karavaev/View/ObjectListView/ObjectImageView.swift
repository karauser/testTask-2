//
//  CashedImageView.swift
//  rsttur_karavaev
//
//  Created by Sergey on 15/05/23.
//

import SwiftUI

struct ObjectImageView: View {
    var image: String
    @State private var imageData: Data? = nil
    
    var body: some View {
        VStack {
            if let imageData = imageData,
               let uiImage   = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width / 3.5 , height: getRect().height / 10)
                    .cornerRadius(15)
            } else {
                ZStack {
                    Color.gray
                        .frame(width: getRect().width / 3.5 , height: getRect().height / 10)
                        .cornerRadius(15)
                    ProgressView()
                }
                .onAppear {
                    if let imageURL = URL(string: image) {
                        ImageCache.shared.getImageData(for: imageURL) { imageData in
                            self.imageData = imageData
                        }
                    }
                }
            }
        }
        .padding(.trailing)
    }
}

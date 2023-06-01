//
//  ImageCache.swift
//  rsttur_karavaev
//
//  Created by Sergey on 17/05/23.
//

import Foundation

class ImageCache {
    static let shared = ImageCache()
    
    private var cache: [String: Data] = [:]
    
    private init() {}
    
    func getImageData(for url: URL, completion: @escaping (Data?) -> Void) {
        if let cachedImageData = cache[url.absoluteString] {
           
            completion(cachedImageData)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let imageData = data, error == nil else {
                    completion(nil)
                    return
                }
                self.cache[url.absoluteString] = imageData
                
                completion(imageData)
            }.resume()
        }
    }
}

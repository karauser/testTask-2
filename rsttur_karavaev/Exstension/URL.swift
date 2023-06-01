//
//  URL.swift
//  rsttur_karavaev
//
//  Created by Sergey on 17/05/23.
//

import Foundation

extension URL {
    func loadImageData(completion: @escaping (Data?) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: self)
                completion(data)
            } catch {
                print("Failed to load image data:", error)
                completion(nil)
            }
        }
    }
}

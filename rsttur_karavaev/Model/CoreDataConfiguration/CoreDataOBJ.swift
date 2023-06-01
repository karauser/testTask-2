//
//  CoreDataOBJ.swift
//  rsttur_karavaev
//
//  Created by Sergey on 17/05/23.
//  note

import Foundation
import CoreData

@objc(CachedImage)
public class ImageData: NSManagedObject {
    @NSManaged public var id: Int
    @NSManaged public var imageData: Data?
}

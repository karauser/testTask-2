//
//  CoreDataManager2.swift
//  rsttur_karavaev
//
//  Created by Sergey on 17/05/23.
//  note

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    private let persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name: "Data")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Failed to save Core Data context: \(nserror)")
            }
        }
    }


    func saveImageData(_ imageData: Data, id: Int) {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "ImageData", in: context) {
            let imageObject = ImageData(entity: entity, insertInto: context)
            imageObject.id = id
            imageObject.imageData = imageData
            
            do {
                try context.save()
                print("Image data saved successfully")
            } catch {
                print("Failed to save image data: \(error.localizedDescription)")
            }
        }
    }
    func getImageData(forId id: Int) -> Data? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ImageData> = NSFetchRequest<ImageData>(entityName: "CachedImage")
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        fetchRequest.fetchLimit = 1

        do {
            let result = try context.fetch(fetchRequest)
            return result.first?.imageData
        } catch {
            print("Failed to fetch image data: \(error)")
            return nil
        }
    }
}

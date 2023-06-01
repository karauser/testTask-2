//
//  ViewModel.swift
//  rsttur_karavaev
//
//  Created by Sergey on 08/05/23.
//

import SwiftUI
import CoreData

class ViewModel: ObservableObject {
    
    init() { loadData() }
    
    @Published var response: Response?
    @Published var isLoaded: Bool            = false
    @Published var filteredObjects: [Object] = []
    private let userDefaultsKey              = "cachedData"
    private let apiManager                   = APIManager.shared

    func open2GISApp(with object: Object?) {
       guard let object = object else { return }
       let latitude     = object.lat
       let longitude    = object.lon
       let urlStr       = "dgis://2gis.ru/routeSearch/rsType/car/to/\(longitude),\(latitude)"
       if let url       = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
           UIApplication.shared.open(url)
       } else {
           // Приложение 2GIS недоступно, открыть App Store
           let appStoreURLStr = "https://apps.apple.com/ru/app/2gis-offline-map-navigation/id481627348?l=en"
           if let appStoreURL = URL(string: appStoreURLStr) {
               UIApplication.shared.open(appStoreURL)
           }
       }
   }
    // Функция для получения названия дня по номеру
    private func getDayName(for day: Int) -> String {
        switch day {
        case 1:
            return "Понедельник"
        case 2:
            return "Вторник"
        case 3:
            return "Среда"
        case 4:
            return "Четверг"
        case 5:
            return "Пятница"
        case 6:
            return "Суббота"
        case 7:
            return "Воскресенье"
        default:
            return ""
        }
    }
    
    func buildAlertMessage(for object: Object?) -> Text {
        guard let object = object else { return Text("") }
        
        var message = Text("Вы хотите построить маршрут до \(object.name)?")
        
        if let workingHours = object.workingHours {
            message = message + Text("\n\nРабочие часы:")

            for workingHour in workingHours {
                for day in workingHour.days {
                    let dayName = getDayName(for: day)
                    message = message + Text("\n\(dayName): \(workingHour.from) - \(workingHour.to)")
                }
            }
        } else {
            message = message + Text("\n\nВнимание! Нет данных по рабочим часам заведения.")
        }
        return message
    }
    func filterObjects(for category: Category) {
         guard let objects = response?.data.objects else {
             filteredObjects = []
             return
         }
         filteredObjects = objects.filter { $0.type == category.type }
     }
    
    func saveData() {
            guard let response = response else { return }
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(response)
                UserDefaults.standard.set(data, forKey: userDefaultsKey)
            } catch {
                print("Failed to save data to UserDefaults: \(error)")
            }
        }
        
        func loadCachedData() {
            guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else { return }
            do {
                let decoder = JSONDecoder()
                let cachedResponse = try decoder.decode(Response.self, from: data)
                response = cachedResponse
                isLoaded = true
            } catch {
                print("Failed to load cached data from UserDefaults: \(error)")
            }
        }
    
    func loadData() {
        if let savedData  = UserDefaults.standard.data(forKey: "response"),
           let response   = try? JSONDecoder().decode(Response.self, from: savedData) {
            self.response = response
            self.isLoaded = true
        } else {
            apiManager.fetchData { [weak self] result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self?.response = response
                        self?.isLoaded = true
                        self?.saveData()
                    }
                case .failure(let error):
                    print("Ошибка получения данных: \(error)")
                }
            }
        }
    }

}

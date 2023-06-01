//
//  ObjectsView.swift
//  rsttur_karavaev
//
//  Created by Sergey on 15/05/23.
//

import SwiftUI

struct ObjectListView: View {
    let category: Category
    let objects: [Object]
    @StateObject private var viewModel = ViewModel()
    @State private var showAlert          = false
    @State private var selectedObject: Object?
    
    var body: some View {
        List(viewModel.filteredObjects) { object in
            // Отображение объекта
            VStack(alignment: .leading) {
                HStack {
                    ObjectImageView(image: object.image)
                    VStack(alignment: .leading) {
                        Text(object.name)
                            .font(.headline)
                            .onTapGesture {
                                showAlert = true
                                selectedObject = object
                            }
                        
                        Text(object.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(2)
                    }
                }
            }
            .onTapGesture {
                showAlert      = true
                selectedObject = object
            }
        }
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Построить маршрут?"),
                message: viewModel.buildAlertMessage(for: selectedObject),
                primaryButton: .default(Text("Да"), action: {
                    viewModel.open2GISApp(with: selectedObject)
                }),
                secondaryButton: .cancel(Text("Отмена"))
            )
        }
        .navigationTitle(category.name)
        .onAppear {
            // Загрузка сохраненных данных
            viewModel.loadCachedData()
            // Фильтрация
            viewModel.filterObjects(for: category)
        }
        .onDisappear {
            // Сохранение данных при закрытии экрана
            viewModel.saveData()
        }
    }
}




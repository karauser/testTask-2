//
//  ContentView.swift
//  rsttur_karavaev
//
//  Created by Sergey on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {

        NavigationStack {
            
            ZStack {
                Color.green.ignoresSafeArea(.all)
                VStack {
                    
                    List(viewModel.response?.data.categories ?? [], id: \.self) { category in
                        NavigationLink(destination: ObjectListView(category: category, objects: viewModel.response?.data.objects ?? [])) {
                            HStack {
                                Text(category.emoji)
                                Text(category.name)
                                    .font(.headline)
                                Spacer()
                                CircleTextView(text: String(category.count), color: normalizeColor(category.color))
                            }
                        }
                    }
                    
                    .navigationTitle("Категории")
                    .onAppear {
                        viewModel.loadCachedData()
                    }
                    .onDisappear {
                        viewModel.saveData()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


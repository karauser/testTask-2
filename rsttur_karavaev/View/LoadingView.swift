//
//  LoadingView.swift
//  rsttur_karavaev
//
//  Created by Sergey on 17/05/23.
//
//
import SwiftUI

    //Fake loading screen
struct LoadingView: View {
    @State private var showContentView    = false
    @StateObject private var viewModel    = ViewModel()
    
    var body: some View {
        VStack {
            Image("RSTTUR")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3, height: getRect().width / 3)
            
            ProgressView()
        }
        .onAppear {
            viewModel.loadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showContentView = true
                    }
        }
        .fullScreenCover(isPresented: $showContentView) {
            ContentView()
        }
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

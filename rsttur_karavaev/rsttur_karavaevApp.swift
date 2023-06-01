//
//  rsttur_karavaevApp.swift
//  rsttur_karavaev
//
//  Created by Sergey on 08/05/23.
//

import SwiftUI

@main
struct rsttur_karavaevApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                            LoadingView()
                                .navigationBarTitle("Loading")
                                .navigationBarHidden(true)
                        }
                    }
        }
    }
    

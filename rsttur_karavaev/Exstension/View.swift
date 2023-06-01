//
//  View.swift
//  rsttur_karavaev
//
//  Created by Sergey on 12/05/23.
//

import Foundation
import SwiftUI

//get Screen size and frame

extension View {
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first
                as? UIWindowScene else {
                    return .zero
                }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
   
}

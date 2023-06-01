//
//  CircleListView.swift
//  rsttur_karavaev
//
//  Created by Sergey on 17/05/23.
//

import SwiftUI

struct CircleTextView: View {
    var text: String?
    var color: Color?
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color ?? Color.red)
                .frame(width: 30, height: 30)
            Text(text ?? "0")
                .foregroundColor(.white)
        }
    }
}



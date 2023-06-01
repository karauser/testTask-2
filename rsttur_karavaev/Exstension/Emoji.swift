//
//  Emoji.swift
//  rsttur_karavaev
//
//  Created by Sergey on 12/05/23.
//

import Foundation

extension Category {
    var emoji: String {
        switch type {
        case "food":
            return "🍔"
        case "place":
            return "🗺"
        case "fun":
            return "🎉"
        case "child":
            return "🧒"
        case "infrastructure":
            return "🏢"
        case "shop":
            return "🛍"
        case "gift":
            return "🎁"
        default:
            return ""
        }
    }
}

//
//  Color.swift
//  rsttur_karavaev
//
//  Created by Sergey on 09/05/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}


func jsonTextFormatter(_ color: String) -> Color? {
    let formattedString = color.replacingOccurrences(of: "-", with: "")
    return Color(formattedString)
}

func normalizeColor(_ color: String) -> Color {
    switch color {
    case "gray-01":
        return .gray01
    case "gray-02":
        return .gray02
    case "gray-03":
        return .gray03
    case "gray-04":
        return .gray04
    case "gray-05":
        return .gray05
    case "gray-06":
        return .gray06
    case "gray-07":
        return .gray07
    case "gray-08":
        return .gray08
    case "gray-09":
        return .gray09
    case "gray-10":
        return .gray10
    case "gray-11":
        return .gray11
    case "gray-12":
        return .gray12
    case "gray-13":
        return .gray13
    case "gray-14":
        return .gray14
    case "gray-15":
        return .gray15
    case "gray-16":
        return .gray16
    case "gray-17":
        return .gray17
    case "gray-18":
        return .gray18
    case "gray-19":
        return .gray19
    case "gray-20":
        return .gray20
    case "primary-01":
        return .primary01
    case "primary-02":
        return .primary02
    case "primary-03":
        return .primary03
    case "primary-04":
        return .primary04
    case "primary-05":
        return .primary05
    case "primary-06":
        return .primary06
    case "primary-07":
        return .primary07
    case "primary-08":
        return .primary08
    case "primary-09":
        return .primary09
    case "primary-10":
        return .primary10
    case "success-01":
        return .success01
    case "success-02":
        return .success02
    case "success-03":
        return .success03
    case "success-04":
        return .success04
    case "success-05":
        return .success05
    case "success-06":
        return .success06
    case "success-07":
        return .success07
    case "success-08":
        return .success08
    case "success-09":
        return .success09
    case "success-10":
        return .success10
    case "warning-01":
        return .warning01
    case "warning-02":
        return .warning02
    case "warning-03":
        return .warning03
    case "warning-04":
        return .warning04
    case "warning-05":
        return .warning05
    case "warning-06":
        return .warning06
    case "warning-07":
        return .warning07
    case "warning-08":
        return .warning08
    case "warning-09":
        return .warning09
    case "warning-10":
        return .warning10
    case "danger-01":
        return .danger01
    case "danger-02":
        return .danger02
    case "danger-03":
        return .danger03
    case "danger-04":
        return .danger04
    case "danger-05":
        return .danger05
    case "danger-06":
        return .danger06
    case "danger-07":
        return .danger07
    case "danger-08":
        return .danger08
    case "danger-09":
        return .danger09
    case "danger-10":
        return .danger10
    case "info-01":
        return .info01
    case "info-02":
        return .info02
    case "info-03":
        return .info03
    case "info-04":
        return .info04
    case "info-05":
        return .info05
    case "info-06":
        return .info06
    case "info-07":
        return .info07
    case "info-08":
        return .info08
    case "info-09":
        return .info09
    case "info-10":
        return .info10
    case "violet-01":
        return .violet01
    case "violet-02":
        return .violet02
    case "violet-03":
        return .violet03
    case "violet-04":
        return .violet04
    case "violet-05":
        return .violet05
    case "violet-06":
        return .violet06
    case "violet-07":
        return .violet07
    case "violet-08":
        return .violet08
    case "violet-09":
        return .violet09
    case "violet-10":
        return .violet10
    case "purple-01":
        return .purple01
    case "purple-02":
        return .purple02
    case "purple-03":
        return .purple03
    case "purple-04":
        return .purple04
    case "purple-05":
        return .purple05
    case "purple-06":
        return .purple06
    case "purple-07":
        return .purple07
    case "purple-08":
        return .purple08
    case "purple-09":
        return .purple09
    case "purple-10":
        return .purple10
    case "yellow-01":
        return .yellow01
    case "yellow-02":
        return .yellow02
    case "yellow-03":
        return .yellow03
    case "yellow-04":
        return .yellow04
    case "yellow-05":
        return .yellow05
    case "yellow-06":
        return .yellow06
    case "yellow-07":
        return .yellow07
    case "yellow-08":
        return .yellow08
    case "yellow-09":
        return .yellow09
    case "yellow-10":
        return .yellow10
    case "cyan-01":
        return .cyan01
    case "cyan-02":
        return .cyan02
    case "cyan-03":
        return .cyan03
    case "cyan-04":
        return .cyan04
    case "cyan-05":
        return .cyan05
    case "cyan-06":
        return .cyan06
    case "cyan-07":
        return .cyan07
    case "cyan-08":
        return .cyan08
    case "cyan-09":
        return .cyan09
    case "cyan-10":
        return .cyan10
    default:
        return
        Color.red
    }
}

extension Color {
    static let backgroundColor = Color.black
    static let gray01 = Color(hex: "#FFFFFF")
    static let gray02 = Color(hex: "#FFFFFF")
    static let gray03 = Color(hex: "#FFFFFF")
    static let gray04 = Color(hex: "#FFFFFF")
    static let gray05 = Color(hex: "#FAFAFA")
    static let gray06 = Color(hex: "#F5F5F5")
    static let gray07 = Color(hex: "#E5E5E5")
    static let gray08 = Color(hex: "#D9D9D9")
    static let gray09 = Color(hex: "#D1D1D1")
    static let gray10 = Color(hex: "#BFBFBF")
    static let gray11 = Color(hex: "#C7C7C7")
    static let gray12 = Color(hex: "#A6A6A6")
    static let gray13 = Color(hex: "#999999")
    static let gray14 = Color(hex: "#808080")
    static let gray15 = Color(hex: "#666666")
    static let gray16 = Color(hex: "#4D4D4D")
    static let gray17 = Color(hex: "#333333")
    static let gray18 = Color(hex: "#212121")
    static let gray19 = Color(hex: "#0D0D0D")
    static let gray20 = Color(hex: "#0D0D0D")
    
    static let primary01 = Color(hex: "#F2F8FF")
    static let primary02 = Color(hex: "#E6F1FE")
    static let primary03 = Color(hex: "#CCE3FE")
    static let primary04 = Color(hex: "#B3D5FD")
    static let primary05 = Color(hex: "#99C7FD")
    static let primary06 = Color(hex: "#80B9FC")
    static let primary07 = Color(hex: "#66ABFC")
    static let primary08 = Color(hex: "#4096FB")
    static let primary09 = Color(hex: "#2688FB")
    static let primary10 = Color(hex: "#1A81FA")
    
    static let success01 = Color(hex: "#F3FBF7")
    static let success02 = Color(hex: "#E7F6F0")
    static let success03 = Color(hex: "#CFEDE1")
    static let success04 = Color(hex: "#B8E5D2")
    static let success05 = Color(hex: "#A0DCC3")
    static let success06 = Color(hex: "#88D3B3")
    static let success07 = Color(hex: "#70CAA4")
    static let success08 = Color(hex: "#41B986")
    static let success09 = Color(hex: "#29B077")
    static let success10 = Color(hex: "#11A768")
    
    static let warning01 = Color(hex: "#FEF9F2")
    static let warning02 = Color(hex: "#FDF3E6")
    static let warning03 = Color(hex: "#FBE8CC")
    static let warning04 = Color(hex: "#F9DCB3")
    static let warning05 = Color(hex: "#F7D199")
    static let warning06 = Color(hex: "#F5C580")
    static let warning07 = Color(hex: "#F3BA66")
    static let warning08 = Color(hex: "#EFA333")
    static let warning09 = Color(hex: "#ED971A")
    static let warning10 = Color(hex: "0xEB8C00")
        
        static let danger01 = Color(hex: "0xFFF5F5")
        static let danger02 = Color(hex: "0xFFECEB")
        static let danger03 = Color(hex: "0xFFD8D6")
        static let danger04 = Color(hex: "0xFFC5C2")
        static let danger05 = Color(hex: "0xFFB1AD")
        static let danger06 = Color(hex: "0xFF9E99")
        static let danger07 = Color(hex: "0xFF8B85")
        static let danger08 = Color(hex: "0xFF645C")
        static let danger09 = Color(hex: "0xFF5047")
        static let danger10 = Color(hex: "0xFF3D33")
        
        static let info01 = Color(hex: "0xF2F9FC")
        static let info02 = Color(hex: "0xE6F3FA")
        static let info03 = Color(hex: "0xCCE8F5")
        static let info04 = Color(hex: "0xB3DCF0")
        static let info05 = Color(hex: "0x99D1EB")
        static let info06 = Color(hex: "0x80C5E5")
        static let info07 = Color(hex: "0x66B9E0")
        static let info08 = Color(hex: "0x33A2D6")
        static let info09 = Color(hex: "0x1A97D1")
        static let info10 = Color(hex: "0x008BCC")
        
        static let violet01 = Color(hex: "0xF6F4FA")
        static let violet02 = Color(hex: "0xECE9F5")
        static let violet03 = Color(hex: "0xDAD4EB")
        static let violet04 = Color(hex: "0xC7BEE0")
        static let violet05 = Color(hex: "0xB5A9D6")
        static let violet06 = Color(hex: "0xA293CC")
        static let violet07 = Color(hex: "0x8F7DC2")
        static let violet08 = Color(hex: "0x6A52AD")
        static let violet09 = Color(hex: "0x583DA3")
        static let violet10 = Color(hex: "0x452799")
        
        static let purple01 = Color(hex: "0xF9F4FA")
        static let purple02 = Color(hex: "0xF3E9F5")
        static let purple03 = Color(hex: "0xE7D3EB")
        static let purple04 = Color(hex: "0xDCBEE0")
        static let purple05 = Color(hex: "0xD0A8D6")
        static let purple06 = Color(hex: "0xC492CC")
        static let purple07 = Color(hex: "0xB87CC2")
        static let purple08 = Color(hex: "0xA151AD")
        static let purple09 = Color(hex: "0x953BA3")
        static let purple10 = Color(hex: "0x892599")
    
       static let yellow01 = Color(hex: "FFFDF2")
       static let yellow02 = Color(hex: "FFFCE6")
       static let yellow03 = Color(hex: "FFF8CC")
       static let yellow04 = Color(hex: "FFF5B3")
       static let yellow05 = Color(hex: "FFF199")
       static let yellow06 = Color(hex: "FFEE80")
       static let yellow07 = Color(hex: "FFEB66")
       static let yellow08 = Color(hex: "FFE433")
       static let yellow09 = Color(hex: "FFE01A")
       static let yellow10 = Color(hex: "FFDD00")
       
       static let cyan01 = Color(hex: "F2F9FA")
       static let cyan02 = Color(hex: "E6F4F5")
       static let cyan03 = Color(hex: "CCE9EB")
       static let cyan04 = Color(hex: "B3DEE1")
       static let cyan05 = Color(hex: "99D3D7")
       static let cyan06 = Color(hex: "80C8CD")
       static let cyan07 = Color(hex: "66BDC3")
       static let cyan08 = Color(hex: "33A7AF")
       static let cyan09 = Color(hex: "1A9CA5")
       static let cyan10 = Color(hex: "00919B")
}

extension Gradient {
    static let g01 = Gradient(colors: [.init(hex: "FF3459"), .init(hex: "B9493C")])
    static let g02 = Gradient(colors: [.init(hex: "5B3CDC"), .init(hex: "0CA9B3")])
    static let g03 = Gradient(colors: [.init(hex: "0CE6E2"), .init(hex: "5B1220")])
    static let g04 = Gradient(colors: [.init(hex: "3E1451"), .init(hex: "A788F5")])
    static let g05 = Gradient(colors: [.init(hex: "98D9E4"), .init(hex: "EE32B9")])
    static let g06 = Gradient(colors: [.init(hex: "0AAD75"), .init(hex: "617D85")])
    static let g07 = Gradient(colors: [.init(hex: "415E8D"), .init(hex: "D160D8")])
    static let g08 = Gradient(colors: [.init(hex: "5371D4"), .init(hex: "55E7D2")])
    static let g09 = Gradient(colors: [.init(hex: "5E56F0"), .init(hex: "1D2FA0")])
    
}

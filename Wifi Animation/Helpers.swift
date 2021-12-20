//
//  Helpers.swift
//  Wifi Animation
//
//  Created by Omar Bakry on 20/12/2021.
//

import Foundation
import SwiftUI

func hStackLeadingView(isConnecting : Bool, doneNumber : Double) -> some View {
    return Group {
        if isConnecting {
            doneNumber == 1.5 ? AnyView (Image(systemName: "paperplane.fill").foregroundColor(.blue)) : doneNumber == 11 ? AnyView(Image(systemName: "wifi")) : AnyView (ProgressView().padding(.trailing,5))
            
    }else{
         Image(systemName: "wifi")
    }
    }
}

enum MyColors {
    case green,white,black;
    
    func getColor() -> String{
    switch self {
    case .green :
        return "#3E9F51"
    case .white:
        return "#DFE0E0"
    case .black:
     return "#2A2A2B"
    }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

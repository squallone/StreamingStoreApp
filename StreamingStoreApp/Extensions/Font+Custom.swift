//
//  Font+Custom.swift
//  StreamingStoreApp
//
//  Created by Abdiel Soto on 07/11/24.
//

import SwiftUI

enum CustomFont {
    enum Poppins: String {
        case regular = "Poppins-Regular"
        case medium = "Poppins-Medium"
    }
}

struct PoppinsFont: ViewModifier {
    let type: CustomFont.Poppins
    let size: CGFloat

    func body(content: Content) -> some View {
        content.font(Font.poppins(type, size: size))
    }
}

extension Font {
    static func poppins(_ type: CustomFont.Poppins, size: CGFloat) -> Font {
        Font.custom(type.rawValue, size: size)
    }
}

extension View {
    func poppinsFont(_ type: CustomFont.Poppins = .regular, size: CGFloat) -> some View {
        modifier(PoppinsFont(type: type, size: size))
    }
}

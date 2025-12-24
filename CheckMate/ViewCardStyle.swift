//
//  ViewCardStyle.swift
//  CheckMate
//
//  Created by Alex Senu
//

import SwiftUI

extension View {
    func cardStyle() -> some View {
        self
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color("SectionBackground"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(Color("AccentColor").opacity(0.15), lineWidth: 1)
            )
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets()) // removes default Form insets
    }
}

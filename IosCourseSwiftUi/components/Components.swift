//
//  Components.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 3/08/23.
//

import Foundation
import SwiftUI


func TextInputLayout(hint : String,textValue: Binding<String>) -> some View{
    return ZStack(alignment: .leading) {
                Text(hint)
                    .foregroundColor(Color(.placeholderText))
                    .offset(y: textValue.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(textValue.wrappedValue.isEmpty ? 1: 0.8, anchor: .leading)
                TextField("", text: textValue)
            }
    .padding(.top, textValue.wrappedValue.isEmpty ? 0 : 15)
            .frame(height: 52)
            .padding(.horizontal, 16)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
    
}

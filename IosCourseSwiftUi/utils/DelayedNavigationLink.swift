//
//  DelayedNavigationLink.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 18/07/23.
//

import Foundation
import SwiftUI

struct DelayedNavigationLink<Destination: View, Label: View>: View {
    @State private var linkIsActive = false

    private let delay: DispatchTimeInterval
    private var destination: () -> Destination
    private var label: () -> Label

    init(delay: DispatchTimeInterval, destination: @escaping () -> Destination) where Label == EmptyView {
        self.init(delay: delay, destination: destination, label: EmptyView.init)
    }

    init(delay: DispatchTimeInterval, destination: @escaping () -> Destination, label: @escaping () -> Label) {
        self.delay = delay
        self.destination = destination
        self.label = label
    }

    var body: some View {
        NavigationLink(isActive: $linkIsActive, destination: destination, label: label)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    linkIsActive = true
                }
            }
    }
}

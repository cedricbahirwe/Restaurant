//
//  Helpers.swift
//  Restaurant
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import Foundation
import SwiftUI
import Combine


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SheetView<Content: View> : View {
    
    @Binding var showCard: Bool
    var height: CGFloat = 360
    var content: () -> Content
    @State private var show = false
    @State private var viewState  = CGSize.zero
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    
    @State private var kHeight: CGFloat = 0.0

    
    var body: some View {
        content()
            .zIndex(1000)
            .offset(y: showCard ? height : 1000)
            .offset(y: -kHeight)
            .blur(radius: show ? 20 : 0)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .offset(y: self.bottomState.height)
            .gesture(
                DragGesture().onChanged { value in
                    self.bottomState = value.translation
                    if self.showFull {
                        self.bottomState.height += -300
                    }
                    if self.bottomState.height < -300 {
                        self.bottomState.height = -300
                    }
                }
                .onEnded { value in
                    if value.translation.height > 50 {
                        self.showCard = false
                    }
                    if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                        self.bottomState.height = -300
                        self.showFull = true
                    } else {
                        self.bottomState = .zero
                        self.showFull = false
                    }
                    
                }
            )
            .onReceive(Publishers.keyboardHeight, perform: { kHeight = $0-30 })

    }
}

#if canImport(UIKit)
extension ViewModifier {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { newValue in
                wrappedValue = newValue
                handler(newValue )
            }
        )
    }
}
extension Binding {
    var observeKeyboard: Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { newValue in
                wrappedValue = newValue
                hideKeyboard()
            }
        )
    }
}

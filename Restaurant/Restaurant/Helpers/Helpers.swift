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

    var content: () -> Content
    @State private var show = false
    @State private var viewState  = CGSize.zero
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    
    var body: some View {
        content()
            .zIndex(1000)
            .offset(y: showCard ? 360 : 1000)
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
    }
}
struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0
    @State private var yOffSet: CGFloat = 0
    var isForm = false
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .offset(y: isForm ? -yOffSet : 0)
                .padding(.bottom, isForm ? 0 : bottomPadding)
                // 2.
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    // 3.
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    // 4.
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    // 5.
                    bottomPadding = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
                    yOffSet = bottomPadding - 20
            }
                // 6.
                .animation(.easeOut(duration: 0.16))
        }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}

extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    private static weak var _currentFirstResponder: UIResponder?
    
    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}

//From vadimbulavin.com
extension Publishers {
    // 1.
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        // 2.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        // 3.
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

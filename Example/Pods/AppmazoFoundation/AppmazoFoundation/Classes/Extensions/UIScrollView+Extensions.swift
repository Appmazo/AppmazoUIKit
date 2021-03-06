//
//  UIScrollView+Extensions.swift
//  AppmazoKit
//
//  Created by James Hickman on 5/17/18.
//  Copyright © 2018 Appmazo, LLC. All rights reserved.
//

import UIKit

public extension UIScrollView {
    private struct Key {
        static var keyboardObserver = "keyboardObserver"
    }
    
    class KeyboardObserver: NSObject {
        static var keyboardFrame = CGRect.zero
        weak var scrollView: UIScrollView?
        var originalContentInset: CGFloat = 0.0
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
        init(scrollView: UIScrollView) {
            self.scrollView = scrollView
            
            super.init()

            originalContentInset = scrollView.contentInset.bottom
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc func keyboardWillShow(_ notification: Notification) {
            guard let keyboardData: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue, let scrollView = scrollView else { return }
            KeyboardObserver.keyboardFrame = keyboardData.cgRectValue
            scrollView.adjustBottomInset(forKeyboardFrame: keyboardData.cgRectValue)
        }
        
        @objc func keyboardDidHide(_ notification: Notification) {
            guard let scrollView = scrollView else { return }
            scrollView.contentInset.bottom = originalContentInset
            scrollView.scrollIndicatorInsets.bottom = originalContentInset
        }
    }
    
    /**
     Automatically changes the scroll view's content size to accommodate the keyboard.
     */
    var automaticallytAdjustsInsetsForKeyboard: Bool {
        get {
            return !(keyboardObserver == nil)
        }
        set {
            let keyboardObserverIsNil = keyboardObserver == nil
            if newValue == true && keyboardObserverIsNil {
                keyboardObserver = KeyboardObserver(scrollView: self)
            } else if newValue == false && !keyboardObserverIsNil {
                keyboardObserver = nil
            }
        }
    }
    
    /**
     Manually changes the scroll view's content size to accommodate the keyboard.
     */
    func adjustInsetsForKeyboard() {
        adjustBottomInset(forKeyboardFrame: KeyboardObserver.keyboardFrame)
    }
    
    private var keyboardObserver: KeyboardObserver? {
        get { return objc_getAssociatedObject(self, &Key.keyboardObserver) as? KeyboardObserver }
        set { objc_setAssociatedObject(self, &Key.keyboardObserver, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private func adjustBottomInset(forKeyboardFrame frame: CGRect) {
        let keyboardFrame = convert(frame, from: nil)
        let bottomInset = bounds.intersection(keyboardFrame).size.height + (keyboardObserver?.originalContentInset ?? 0.0)
        contentInset.bottom = bottomInset
        scrollIndicatorInsets.bottom = bottomInset
    }
}

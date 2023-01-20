//
//  UIAlertController+AppVersion.swift
//  AppVersion
//

import UIKit

typealias AlertHandler = () -> Void

extension UIAlertController {
    func present() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }

    static func appVersionAlert(_ style: UIAlertController.Style, version: String) -> UIAlertController {
        return UIAlertController(title: "新しいアップデートがあります", message: "今すぐ \(version)にアップデートして新しい機能を体験しよう！", preferredStyle: style)
    }

    @discardableResult
    func addCancleAction(handler: AlertHandler? = nil) -> Self {
        addAction(UIAlertAction(title: "後で", style: .cancel, handler: { _ in
            guard let handler = handler else { return }
            handler()
        }))
        return self
    }

    @discardableResult
    func addUpdateAction(handler: AlertHandler? = nil) -> Self {
        addAction(UIAlertAction(title: "アップデートする", style: .default, handler: { _ in
            guard let handler = handler else { return }
            handler()
        }))
        return self
    }

    @discardableResult
    func addSkipAction(handler: AlertHandler? = nil) -> Self {
        addAction(UIAlertAction(title: "アップデートをスキップする", style: .default, handler: { _ in
            guard let handler = handler else { return }
            handler()
        }))
        return self
    }

    @discardableResult
    func addNeverAction(handler: AlertHandler? = nil) -> Self {
        addAction(UIAlertAction(title: "Never Suggest to Update", style: .destructive, handler: { _ in
            guard let handler = handler else { return }
            handler()
        }))
        return self
    }
}

//
//  UIViewController+Extension.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 18/06/2024.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {

    func openSafariPageWith(url: String) {
        let vc = SFSafariViewController(url: URL(string: url)!)
        vc.preferredControlTintColor = .systemBlue
        self.present(vc, animated: true)
    }

    func getSoftFeedbackGenerator() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .soft)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }

}

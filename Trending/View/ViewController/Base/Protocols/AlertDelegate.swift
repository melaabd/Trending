//
//  Listener.swift
//  Trending
//
//  Created by melaabd on 2/27/22.
//

import UIKit

/// Protocol for showing a alerts in case error happened
protocol AlertDelegate: UIViewController {
    func alertWith(msg: String)
}

/// default implementation for alert protocol
extension AlertDelegate {
    func alertWith(msg: String) {
        GCD.onMain { [weak self] in
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
            alert.addAction(dismissAction)
            self?.present(alert, animated: true)
        }
    }
}

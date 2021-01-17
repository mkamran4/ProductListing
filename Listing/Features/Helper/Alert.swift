//
//  Alert.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

final class Alert {
    
    typealias ActionCallback = ((UIAlertAction) -> Void)
    
    public static func show(on viewController: UIViewController,
                     title: String? = nil,
                     message: String,
                     actionCallback: ActionCallback? = nil
                    )
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""),
                                     style: .default,
                                     handler: actionCallback)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}

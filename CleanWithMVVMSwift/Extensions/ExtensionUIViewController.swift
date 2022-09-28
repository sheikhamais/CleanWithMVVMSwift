//
//  ExtensionUIViewController.swift
//  CleanWithMVVMSwift
//
//  Created by Amais Sheikh on 07/04/2022.
//

import UIKit

extension UIViewController
{
    func showSingleButtonAlert(withTitle: String, withMessage: String, buttonTitle: String = "Dismiss", completion: VoidHandler? = nil)
    {
        let alert = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: buttonTitle, style: .default)
        { _ in completion?() }
        
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }
}

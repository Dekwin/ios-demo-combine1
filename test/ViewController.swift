//
//  ViewController.swift
//  test
//
//  Created by Igor Kasyanenko on 08.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purchaseButton: UIButton!
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: priceTextField)
            .map { $0.object as? UITextField}
            .compactMap { $0?.text }
            .map { str -> Bool in
                if let number = Double(str) {
                    return number > 10
                } else {
                    return false
                }
            }
            .assign(to: \.isEnabled, on: purchaseButton)
            
        
    }
}


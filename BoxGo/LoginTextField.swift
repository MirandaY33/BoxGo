//
//  LoginTextField.swift
//  BoxGo
//
//  Created by Shanshan on 11/4/17.
//  Copyright © 2017 Miranda Zhao. All rights reserved.
//

import UIKit
//see all changes we made here are rendered alive in interface builder.
@IBDesignable
class LoginTextField: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
}

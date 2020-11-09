//
//  Extension+UIimage.swift
//  App Notification
//
//  Created by namit on 11/6/20.
//

import Foundation
import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 20, y: 0, width: 25, height: 25))
       iconView.image = image
        iconView.tintColor = UIColor.lightGray
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
    
    
}

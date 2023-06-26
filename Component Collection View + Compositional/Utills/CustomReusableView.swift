//
//  CustomReusableView.swift
//  Component Collection View + Compositional
//
//  Created by Humberto Rodrigues on 24/06/23.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String {get}
}

extension ReusableView where Self: UIView {
    static var identifier: String { String (describing: self) }
}

extension UIView: ReusableView {}

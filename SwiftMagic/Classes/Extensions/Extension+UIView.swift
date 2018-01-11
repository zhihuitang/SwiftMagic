//
//  LoggerViewController.swift
//  SwiftMagic
//
//  Created by Zhihui Tang on 2018-01-10.
//


import Foundation
import UIKit

extension UIView {
    var x: CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        get {
            return self.frame.origin.x
        }
    }

    var y: CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        get {
            return self.frame.origin.y
        }
    }

    var centerX: CGFloat {
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
        get {
            return self.center.x
        }
    }

    var centerY: CGFloat {
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
        get {
            return self.center.y
        }
    }

    var width: CGFloat {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        get {
            return self.frame.size.width
        }
    }

    var height: CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get {
            return self.frame.size.height
        }
    }

    var size: CGSize {
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
        get {
            return self.frame.size
        }
    }

    var origin: CGPoint {
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
        get {
            return self.frame.origin
        }
    }

    var bottomY: CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
        get {
            return self.height + self.y
        }
    }

    var rightX: CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width
            self.frame = frame
        }
        get {
            return self.width + self.x
        }
    }

    // MARK: - UIView round corner
    ///
    /// - Parameter cornerRadius: radius
    func roundedCorners(cornerRadius: CGFloat) {
        roundedCorners(cornerRadius: cornerRadius, borderWidth: 0, borderColor: nil)
    }

    ///
    /// - Parameters:
    ///   - cornerRadius:
    ///   - borderWidth:
    ///   - borderColor:
    func roundedCorners(cornerRadius: CGFloat?, borderWidth: CGFloat?, borderColor: UIColor?) {
        self.layer.cornerRadius = cornerRadius!
        self.layer.borderWidth = borderWidth!
        self.layer.borderColor = borderColor?.cgColor
        self.layer.masksToBounds = true
    }

    ///
    /// - Parameters:
    ///   - cornerRadius:
    ///   - rectCorner:
    func roundedCorners(cornerRadius: CGFloat?, rectCorner: UIRectCorner?) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: rectCorner!, cornerRadii: CGSize(width: cornerRadius!, height: cornerRadius!))
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        layer.path = path.cgPath
        self.layer.mask = layer
    }

    ///
    /// - Parameters:
    ///   - colors:
    ///   - locations:
    ///   - startPoint: [0...1]
    ///   - endPoint: [0...1]
    func gradientColor(colors: [CGColor], locations: [NSNumber], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        /*
         // vertical
         gradientLayer.startPoint = CGPoint(x: 0, y: 0)
         gradientLayer.endPoint = CGPoint(x: 0, y: 1)
         */
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = self.frame
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - UIView blur
    ///
    /// - Parameter style: UIBlurEffectStyle
    func addBlurEffect(style: UIBlurEffectStyle) {
        let effect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.bounds
        self.backgroundColor = .clear
        self.addSubview(effectView)
        self.sendSubview(toBack: effectView)
    }
}

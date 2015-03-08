//
//  BCDView.swift
//  bTime
//
//  Created by David Christensen on 07/03/15.
//  Copyright (c) 2015 David Christensen. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class BCDView : UIView {
    @IBInspectable var colorOfOn: UIColor! = UIColor(white: 1, alpha: 1)
    @IBInspectable var colorOfOff: UIColor! = UIColor(white: 1, alpha: 0.1)
    @IBInspectable var bits: Int = 4
    @IBInspectable var spacing: Int = 8
    
    private var _value: Int = 6
    @IBInspectable var value: Int {
        get { return _value % (1 << bits) }
        set(newValue) {
            let retain = _value
            _value = newValue;
            if _value != retain {
                self.setNeedsDisplay()
            }
        }
            
    }
    
    private func bit(idx: Int) -> Bool {
        let logica = (1 << idx)
        return (value & logica) >> idx == 1
    }
    
    override func drawRect(rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        
        let bw = Int((rect.width) - (CGFloat(spacing) * 2))
        let bh = Int((rect.height / CGFloat(bits)) - (CGFloat(spacing) * 2))
        let spanh = Int(rect.height / CGFloat(bits))
        
        let start = Int(rect.height)
        
        for i in 0..<bits {
            
            let truth = bit(i)
            let startY = start - ((i+1) * spanh) + Int(spacing)
            let startX = Int(spacing)
            
            let frame = CGRect(x: startX, y: startY, width: bw, height: bh)
            if truth {
                CGContextSetFillColorWithColor(ctx, colorOfOn.CGColor)
            } else {
                CGContextSetFillColorWithColor(ctx, colorOfOff.CGColor)
            }
            
            CGContextFillEllipseInRect(ctx, frame)
            
        }
        
    }
    
}
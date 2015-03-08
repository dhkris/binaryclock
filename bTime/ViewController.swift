//
//  ViewController.swift
//  bTime
//
//  Created by David Christensen on 07/03/15.
//  Copyright (c) 2015 David Christensen. All rights reserved.
//

import UIKit

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

class ViewController: UIViewController {

    @IBOutlet var hHi: BCDView!
    @IBOutlet var hLo: BCDView!
    
    @IBOutlet var mHi: BCDView!
    @IBOutlet var mLo: BCDView!
    
    @IBOutlet var sHi: BCDView!
    @IBOutlet var sLo: BCDView!
    
    @IBOutlet var yHi: BCDView!
    @IBOutlet var yLo: BCDView!
    
    @IBOutlet var moHi: BCDView!
    @IBOutlet var moLo: BCDView!
    
    @IBOutlet var dHi: BCDView!
    @IBOutlet var dLo: BCDView!
    
    private var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.updateClock(self)
    }
    
    @objc(updateClock:)
    @IBAction func updateClock(sender: AnyObject!) {
        
        
        let now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components(NSCalendarUnit.CalendarUnitSecond | NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay, fromDate: now)
        
        var secStr: NSString = "\(components.second)"
        var minStr: NSString = "\(components.minute)"
        var hrStr: NSString = "\(components.hour)"
        
        var dayStr: NSString = "\(components.day)"
        var mntStr: NSString = "\(components.month)"
        var yrStr: NSString = "\(components.year)"
        
        if secStr.length == 1 { secStr = "0" + secStr }
        if minStr.length == 1 { minStr = "0" + minStr }
        if hrStr.length == 1 { hrStr = "0" + hrStr }
        if dayStr.length == 1 { dayStr = "0" + dayStr }
        if mntStr.length == 1 { mntStr = "0" + mntStr }
        yrStr = yrStr.substringFromIndex(2)
        
        let secHi = (secStr.substringWithRange(NSMakeRange(0,1)) as NSString).integerValue
        let secLo = (secStr.substringWithRange(NSMakeRange(1,1)) as NSString).integerValue
        let minHi = (minStr.substringWithRange(NSMakeRange(0,1)) as NSString).integerValue
        let minLo = (minStr.substringWithRange(NSMakeRange(1,1)) as NSString).integerValue
        let hrHi = (hrStr.substringWithRange(NSMakeRange(0,1)) as NSString).integerValue
        let hrLo = (hrStr.substringWithRange(NSMakeRange(1,1)) as NSString).integerValue
        let yeHi = (yrStr.substringWithRange(NSMakeRange(0,1)) as NSString).integerValue
        let yeLo = (yrStr.substringWithRange(NSMakeRange(1,1)) as NSString).integerValue
        let mnHi = (mntStr.substringWithRange(NSMakeRange(0,1)) as NSString).integerValue
        let mnLo = (mntStr.substringWithRange(NSMakeRange(1,1)) as NSString).integerValue
        let daHi = (dayStr.substringWithRange(NSMakeRange(0,1)) as NSString).integerValue
        let daLo = (dayStr.substringWithRange(NSMakeRange(1,1)) as NSString).integerValue
        
        self.hHi.value = hrHi
        self.hLo.value = hrLo
        self.mHi.value = minHi
        self.mLo.value = minLo
        self.sHi.value = secHi
        self.sLo.value = secLo
        self.yHi.value = yeHi
        self.yLo.value = yeLo
        self.moHi.value = mnHi
        self.moLo.value = mnLo
        self.dHi.value = daHi
        self.dLo.value = daLo
        
        delay(0.15) {
            self.updateClock(self)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


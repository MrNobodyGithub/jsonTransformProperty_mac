//
//  ViewController.swift
//  JsonToProperty
//
//  Created by CityMedia on 2018/10/18.
//  Copyright © 2018年 free. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
  
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var textViewR: NSTextView!
    
    @IBAction func btnAction(_ sender: NSButton) {
        
        var str : String = textView.textStorage?.string ?? ""
        
        str = str.replacingOccurrences(of: " ", with: "")
        str = str.replacingOccurrences(of: "\n", with: "")
        str = str.replacingOccurrences(of: "{", with: "")
        str = str.replacingOccurrences(of: "}", with: "")
        let arr:[String] = str.components(separatedBy: ";")
        
        
        var strDef : String = "";
        for substr:String in arr {
            if substr.isEmpty{
                break
            }
            
            let arr = substr.components(separatedBy: "=")
            let key = arr[0]
            let value = arr.last
            
            var lastStr = "/**";
            lastStr = lastStr.appending("\n")
            lastStr = lastStr.appending(" * ")
            lastStr = lastStr.appending(key)
            lastStr = lastStr.appending("  ")
            lastStr = lastStr.appending(value ?? "value")
            lastStr = lastStr.appending("\n")
            lastStr = lastStr.appending("*/")
            lastStr = lastStr.appending("@property(nonatomic,copy) NSString * ")
            lastStr = lastStr.appending(key)
            lastStr = lastStr.appending(";")
            lastStr = lastStr.appending("\n")
            strDef = strDef.appending(lastStr)
        }
        
        
        textViewR.string = strDef
        
        
        print("btn click")
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    


}

/**
 {
 academyId = 1;
 academyName = "\U6570\U7406\U5b66\U9662";
 average = 0;
 cloStartNumber = 1;
 cloStopNumber = 1;
 cloTotalNumber = 1;
 collegeId = 1;
 courseCate = "\U516c\U5171\U5fc5\U4fee\U8bfe";
 courseCode = 201901;
 courseName = testCLO;
 courseScore = 4;
 courseStatus = "<null>";
 courseTimes = "<null>";
 courseType = "\U7406\U8bba\U6559\U5b66";
 createTime = "2018-10-23 10:26:02";
 createUser = 22;
 deleteTime = 0;
 id = 46;
 isRelease = 1;
 majorId = 1;
 majorName = "\U4fe1\U606f\U4e0e\U8ba1\U7b97\U79d1\U5b66";
 releaseTime = "2018-10-30 14:24:39";
 remark = test;
 semester = 1;
 status = 1;
 updateTime = "2018-10-30 14:24:39";
 updateUser = 1;
 year = 2019;
 }
 */


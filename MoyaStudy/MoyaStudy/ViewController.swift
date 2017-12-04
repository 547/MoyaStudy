//
//  ViewController.swift
//  MoyaStudy
//
//  Created by seven on 2017/12/4.
//  Copyright © 2017年 seven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //MARK:以下仅是 array 的一些简单使用方法
        let array = ["q","w","e","r","t","last","u","i","o","p","a","s","d","f","g"]
        let _ = array.filter { (item) -> Bool in
            print("==item===\(item)===")
            return false
        }
        var testIndex = 0
        let test = array.map { (item) -> Int in
            print("++++\(item)+++++")
            testIndex += 1
            return testIndex
        }
        print(test)
        
        
        let best = array.max()
        print("===best===\(best ?? "no")===")
        
        let max = array.max { (first, last) -> Bool in
//            print("f=====\(first) \(first.count) l======\(last) \(last.count)")
            return last.count > first.count
        }
        print("max ======= \(max ?? "no")")
    
        let new = array.sorted { (first, last) -> Bool in
            return first.count > last.count
        }
        print("new ======= \(new)")
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}


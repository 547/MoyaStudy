//
//  ViewController.swift
//  MoyaStudy
//
//  Created by seven on 2017/12/4.
//  Copyright © 2017年 seven. All rights reserved.
//

import UIKit
import Moya
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
        
        
        let min = array.min()
        print("min ==== \(min ?? "no")")
        
        
        //MARK:会把最后一个删掉 返回一个新的 array
        let dropLast = array.dropLast()
        print("drop last ===== \(dropLast) \(array)")
        //MARK:会把第一个删掉 返回一个新的 array
        let dropFirst = array.dropFirst()
        print("drop firsr ===== \(dropFirst)")
        
        
        
        let api = IFoodApi.init()
        api.appendData = ["testw":89]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
class IFoodApi: TargetType {
    
    var baseURL: URL {
        return URL.init(string: "http://121.41.36.161")!
    }
    
    var path: String{
        return basicPath
    }
    
    var method: Moya.Method = .get
    
    var sampleData: Data{
        return try! JSONSerialization.data(withJSONObject: commonData, options: .prettyPrinted)
    }
    
    var task: Task = .requestPlain
    
    var headers: [String : String]? = nil
    
    private var commonData:[String:Any] = ["test":1]
    var appendData:[String:Any]?{
        didSet{
            guard let value = appendData, value.count > 0 else { return }
            commonData.merge(value) { (first, second) -> Void in
                print("first ===== \(first)")
                print("second ===== \(second)")
            }
            print("commonData ====== \(commonData)")
        }
    }
    
    private var basicPath:String = "/restful/web/index.php/takeaway"
    var appendPath:String?{
        didSet{
            guard let value = appendPath, value.count > 0 else { return }
            basicPath += value
        }
    }
    
}

extension IFoodApi {
    static func test() -> IFoodApi {
        let api = IFoodApi.init()
        return api
    }
}

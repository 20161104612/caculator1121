//
//  ViewController.swift
//  jisuanqi
//
//  Created by 20161104612 on 2018/9/26.
//  Copyright © 2018年 20161104612. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var test: UITextField!
    
    @IBOutlet weak var test1: UITextField!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    var changid:Int = 0//计算符号
    var id_minus:Int = 0//正负号
    var num:String = ""//第一个数字
    var result:String = ""
    var count:Int = 0
    
    var control_num = 0//控制第几次运算
    var control_Num = 0//控制按键次数
    
    var control_point = 0//控制小数点计数

    @IBAction func num(_ sender: UIButton) {
        if control_Num == 0 {
            if control_num != 0 {
                test.text = ""
            }
            test1.text = ""
        }
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber{
            test.text = test.text! + digit
        }else{
            test.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        control_Num = control_Num + 1
    }
    
    
    @IBAction func add(_ sender: AnyObject) {
        if changid != 0 {
            output(changid)
            
        }
        num = test.text!
        test1.text = num + "+"
        test.text = ""
        changid = 1
        control_point = 0
    }
    
    @IBAction func minus(_ sender: AnyObject) {
        if changid != 0 {
            output(changid)
        }
        num = test.text!
        test1.text = num + "-"
        test.text = ""
        changid = 2
        control_point = 0
    }
    
    @IBAction func multiply(_ sender: AnyObject) {
        if changid != 0 {
            output(changid)
        }
        num = test.text!
        test1.text = num + "x"
        test.text = ""
        changid = 3
        control_point = 0
    }
    
    @IBAction func division(_ sender: AnyObject) {
        if changid != 0 {
            output(changid)
        }
        num = test.text!
        test1.text = num + "/"
        test.text = ""
        changid = 4
        control_point = 0
    }
    
    @IBAction func output(_ sender: Any) {
        switch changid {
        case 1 :
            result = "\(Double(num)! + Double(test.text!)!)"
            test1.text = num + "+" + test.text! + "="
        case 2 :
            result = "\(Double(num)! - Double(test.text!)!)"
            test1.text = num + "-" + test.text! + "="
        case 3:
            result = "\(Double(num)! * Double(test.text!)!)"
            test1.text = num + "x" + test.text! + "="
        case 4:
            if(test.text == "0")
            {
                result = "错误，除数不能为零"
                test.text = result
                test1.text = ""
            }
            else{
                result = "\(Double(num)! / Double(test.text!)!)"
                test1.text = num + "/" + test.text! + "="
                }
        default:
            result = "0"
        }
        
        if result != "错误，除数不能为零"
        {
        result = String(format:"%0.8f",Double(result)!)
        }
        
        while (result.last == "0"){
            result.removeLast()
        }
        if (result.last == "."){
            result.removeLast()
        }
        test.text = result
        changid = 0
        num = test.text!
        control_Num = 0
        control_num = control_num + 1
    }
    
    @IBAction func ac(_ sender: Any) {
        
        test.text = "0"
        test1.text = ""
        control_point = 0
        control_Num = 0
    }
    
    @IBAction func bu_return(_ sender: Any) {
        test.text?.removeLast()
    }
    
    @IBAction func change(_ sender: Any) {
        if id_minus == 0 {
            test.text = "-" + test.text!
            id_minus = 1
        }
        else {
            test.text?.removeFirst()
            id_minus = 0
        }
    }
    
    @IBAction func point(_ sender: Any) {
        if control_point == 0{
            test.text = test.text! + "."
            control_point = control_point + 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        test.text = "0"
    }
}


//
//  ViewController.swift
//  密碼檢查
//
//  Created by 王偉程 on 2022/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextFIeld: UITextField!
 
    @IBOutlet weak var passWordTextFIeld: UITextField!
    
    @IBOutlet weak var passWordRuleLabel: UILabel!
    
    @IBOutlet weak var alertLabel: UILabel!
    
    
    let tenMostCommonPasswords = [
          "123456",
          "password",
          "12345678",
          "qwerty",
          "12345",
          "123456789",
          "letmein",
          "1234567",
          "football",
          "iloveyou"
      ]
      let digits = "0123456789"
      let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
      
      var commonPassword = false
      var usernameText: String = ""
      var passwordText: String = ""
      var uppercaseCount = 0
      var lowercaseCount = 0
      var digitCount = 0
      var punctuationCount = 0
      var finish = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passWordRuleLabel.numberOfLines = 0
        passWordRuleLabel.text  = "密碼建立規則:\n1.至少10個字元\n2.大小寫字母至少各ㄧ個\n3.至少一個數字\n4.不能含有標點符號\n5.密碼不能包含帳號"
        passWordRuleLabel.tintColor = .white
        
    }

    @IBAction func checkPassword(_ sender: Any) {
        
        usernameText = userNameTextFIeld.text!
        
        passwordText = passWordTextFIeld.text!
        
        for i in 0...tenMostCommonPasswords.count-1 {
            if passwordText.contains(tenMostCommonPasswords[i]) {
                commonPassword = true
                alertLabel.text = "常見密碼，請重新設定"
                break
            } else {
                commonPassword = false
            }
        
            
            for character in passwordText{
                if character.isUppercase {
                    uppercaseCount = uppercaseCount+1
                } else if character.isLowercase {
                    lowercaseCount += 1
                } else if digits.contains(character){
                    digitCount += 1
                }else if punctuation.contains(character) {
                    punctuationCount += 1
                }
                
                
                
                if usernameText.count == 0{
                    alertLabel.text = "請輸入帳號"
                }else if passwordText.count < 10 {
                    alertLabel.text = "密碼至少10個字"
                }else if uppercaseCount == 0{
                    alertLabel.text = "至少包含一個大寫字母"
                }else if lowercaseCount == 0{
                    alertLabel.text = "至少包含一個小寫字母"
                }else if digitCount == 0 {
                    alertLabel.text = "至少包含一個數字"
                }else if punctuationCount != 0 {
                    alertLabel.text = "不能含有特殊符號"
                }else if passwordText == usernameText{
                    alertLabel.text = "密碼不能和帳號一樣"
                }else {
                    finish = true
                    alertLabel.text = "註冊成功"
                }
                
                
            }
        }
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}


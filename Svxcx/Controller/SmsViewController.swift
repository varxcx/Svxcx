//
//  Sms.swift
//  Svxcx
//
//  Created by Vardhan Chopada on 11/24/22.
//

import UIKit

class SmsViewController: UIViewController, UITextFieldDelegate {
    
    private let codeField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 5
        field.placeholder = "Enter Code"
        field.returnKeyType = .continue
        field.textAlignment = .center
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Image.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(codeField)
        codeField.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        codeField.center = view.center
        codeField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) {[weak self] success in
                guard success else {return}
                DispatchQueue.main.async {
                    let vc = AccountViewController()
                    vc.modalPresentationStyle = .fullScreen
                    vc.title = "Enter Code"
                    self?.present(vc, animated: true)
                }
            
            }
        }
        
        return true
    }
    
    
}


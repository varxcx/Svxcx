//
//  ViewController.swift
//  Svxcx
//
//  Created by Vardhan Chopada on 11/24/22.
//

import UIKit

class PhoneViewController: UIViewController, UITextFieldDelegate {
    
    private let phoneField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 5
        field.placeholder = "Phone Number"
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
        
        view.addSubview(phoneField)
        phoneField.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        phoneField.center = view.center
        phoneField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            let number = "+1\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                guard success else {return}
                DispatchQueue.main.async {
                    let vc = SmsViewController()
                    vc.title = "Enter Code"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        return true
    }
    
    
}


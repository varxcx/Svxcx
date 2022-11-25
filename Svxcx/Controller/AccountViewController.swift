//
//  Account.swift
//  Svxcx
//
//  Created by Vardhan Chopada on 11/24/22.
//


import UIKit
import SwiftUI

class AccountViewController: UIViewController{
    let contentView = UIHostingController(rootView: ContentView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        addChild(contentView)
        view.addSubview(contentView.view)
        contentView.view.frame = .init(x: 100, y: 100, width: 200, height: 150)
        contentView.didMove(toParent: self)
//        contentView.view.layer.masksToBounds = true
        setUpConstarints()
            }
    
    fileprivate func setUpConstarints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
  
   
}

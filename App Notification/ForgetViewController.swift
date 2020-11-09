//
//  ForgetViewController.swift
//  App Notification
//
//  Created by namit on 11/6/20.
//

import UIKit

class ForgetViewController: UIViewController {

    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(red:0.898, green:0.898, blue:0.898, alpha: 1.000)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let setView: UIView = {
        let setView = UIView()
        setView.backgroundColor = UIColor(red:0.980, green:0.980, blue:0.980, alpha: 1.000)
        setView.translatesAutoresizingMaskIntoConstraints = false
        setView.layer.cornerRadius = 30
        setView.layer.shadowColor = UIColor.yellow.cgColor
        setView.layer.shadowOffset = CGSize(width: 5, height: 5)
        return setView
    }()
    
    let backGoHome: UIButton = {
        let back = UIButton()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.setTitle("Quay Lại", for: .normal)
        back.setTitleColor(UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000), for: .normal)
        back.setImage(UIImage(named: "back"), for: .normal)
        return back
    
    }()
    let margin:CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setLayOut()
        
        backGoHome.addTarget(self, action: #selector(backHome), for: .touchUpInside)

   
    }
    
    func addSubView() {
        view.addSubview(containerView)
        containerView.addSubview(setView)
        containerView.addSubview(backGoHome)
    }
    
    func setLayOut(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        backGoHome.topAnchor.constraint(equalTo: view.topAnchor, constant: 34).isActive = true
        backGoHome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        backGoHome.widthAnchor.constraint(equalTo: backGoHome.widthAnchor, constant: 0).isActive = true
        backGoHome.heightAnchor.constraint(equalTo: backGoHome.widthAnchor, constant: 0).isActive = true
        
        setView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        setView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        setView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        setView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    }
    
    @objc func backHome(){
        dismiss(animated: true, completion: nil)
    }


}


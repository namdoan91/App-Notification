//
//  ViewController.swift
//  App Notification
//
//  Created by namit on 11/6/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
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
    
    let welcome: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "WELCOME BACK APP NOTIFICATION"
        welcome.textAlignment = .center
        welcome.textColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
//        welcome.backgroundColor = UIColor.red
        welcome.font = UIFont.boldSystemFont(ofSize: 34)
        welcome.numberOfLines = 0
        welcome.layer.shadowColor = UIColor.black.cgColor
        welcome.layer.shadowOffset = CGSize(width: 20, height: 20)
        return welcome
    }()

    let dangNhapText: UITextField = {
        let dangnhap = UITextField()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.setIcon(UIImage(named: "use")!)
        dangnhap.placeholder = "Mã Số Nhân Viên"
        dangnhap.backgroundColor = UIColor(red:1.000, green:1.000, blue:1.000, alpha: 1.000)
        dangnhap.leftViewMode = .always
        dangnhap.layer.cornerRadius = 40
        dangnhap.clearButtonMode = .always
        dangnhap.textAlignment = .center
        return dangnhap
    }()
    let matkhatText: UITextField = {
        let matKhau = UITextField()
        matKhau.translatesAutoresizingMaskIntoConstraints = false
        matKhau.setIcon(UIImage(named: "password")!)
        matKhau.placeholder = "Mật Khẩu Của Bạn"
        matKhau.backgroundColor = UIColor(red:1.000, green:1.000, blue:1.000, alpha: 1.000)
        matKhau.leftViewMode = .always
        matKhau.layer.cornerRadius = 40
        matKhau.isSecureTextEntry = true
        matKhau.clearButtonMode = .always
        matKhau.textAlignment = .center
        return matKhau
    }()
    
    let dangNhapbtnLogin: UIButton = {
        let dangnhap = UIButton()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.backgroundColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
        dangnhap.setTitle("ĐĂNG NHẬP", for: .normal)
        dangnhap.setTitleColor(UIColor.white, for: .normal)
        dangnhap.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        dangnhap.layer.cornerRadius = 40
        return dangnhap
    } ()
    
    let qmkButton: UIButton = {
        let dangnhap = UIButton()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.backgroundColor = UIColor(red:0.980, green:0.980, blue:0.980, alpha: 1.000)
        dangnhap.setTitle("Quên mật khẩu !", for: .normal)
        dangnhap.setTitleColor(UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000), for: .normal)
        dangnhap.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        dangnhap.layer.cornerRadius = 40
        return dangnhap
    } ()
    
    let version: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Ver 1.0.0"
        welcome.textAlignment = .center
        welcome.textColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
//        welcome.backgroundColor = UIColor.red
        welcome.font = UIFont.boldSystemFont(ofSize: 15)
        welcome.numberOfLines = 0
        welcome.layer.shadowColor = UIColor.black.cgColor
        welcome.layer.shadowOffset = CGSize(width: 20, height: 20)
        return welcome
    }()
    
    let margin:CGFloat = 15
//    var responseArray = [User]()
    var session = ""
    var avatarView = ""
    var tenNv = ""
    var msNV = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setLayout()
       
        dangNhapbtnLogin.addTarget(self, action: #selector(btnLogin), for: .touchUpInside)
        qmkButton.addTarget(self, action: #selector(qmkBt), for: .touchUpInside)
        
    }
    func addSubView(){
        view.addSubview(containerView)
        containerView.addSubview(setView)
        containerView.addSubview(dangNhapText)
        containerView.addSubview(matkhatText)
        containerView.addSubview(dangNhapbtnLogin)
        containerView.addSubview(welcome)
        containerView.addSubview(qmkButton)
        containerView.addSubview(version)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        setView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        setView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        setView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        setView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        welcome.topAnchor.constraint(equalTo: setView.topAnchor, constant: 120).isActive = true
        welcome.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        welcome.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        welcome.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        dangNhapText.topAnchor.constraint(equalTo: setView.topAnchor, constant: 260).isActive = true
        dangNhapText.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        dangNhapText.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        dangNhapText.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        matkhatText.topAnchor.constraint(equalTo: dangNhapText.bottomAnchor, constant: margin).isActive = true
        matkhatText.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        matkhatText.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        matkhatText.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        dangNhapbtnLogin.topAnchor.constraint(equalTo: matkhatText.bottomAnchor, constant: 80).isActive = true
        dangNhapbtnLogin.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        dangNhapbtnLogin.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        dangNhapbtnLogin.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        qmkButton.topAnchor.constraint(equalTo: dangNhapbtnLogin.bottomAnchor, constant: 140).isActive = true
        qmkButton.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        qmkButton.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        qmkButton.bottomAnchor.constraint(equalTo: version.bottomAnchor, constant: -70).isActive = true
        
        version.topAnchor.constraint(equalTo: qmkButton.bottomAnchor, constant: 50).isActive = true
        version.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        version.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        version.bottomAnchor.constraint(equalTo: setView.bottomAnchor, constant: -30).isActive = true
        
        
    }
//    func displayMyAlertMessage(userMessage:String){
//
//        let myAlert = UIAlertController(title: "Thong Bao", message: userMessage, preferredStyle: UIAlertController.Style.alert)
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        myAlert.addAction(okAction)
//        present(myAlert, animated: true, completion: nil)
//     }
    @objc func qmkBt(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let qmk = storyboard.instantiateViewController(identifier: "ForgetViewController") as! ForgetViewController
        present(qmk, animated: true, completion: nil)
    }
    
    @objc func btnLogin(){
 
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let url = "https://id.mvpapp.vn/api/v1/system/Login"
//        let par = ["username": self.dangNhapText.text,
//                   "password": self.matkhatText.text]
        let par = ["username": "6006",
                   "password": "170917"]
        AF.request(url, method: .post,parameters: par).responseJSON{ [self]
            response in
            switch response.result{
            case .success(let value):
                    let json = JSON(value)
                    print(json["session_key"].stringValue)
                    self.session.append(json["session_key"].stringValue)
                    print(self.session)
                    self.avatarView.append(json["userData"]["avatar"].stringValue)
                    print(self.avatarView)
                    self.msNV.append(json["userData"]["emp_id"].stringValue)
                    print(msNV)
                self.tenNv.append(json["userData"]["name"].stringValue)
                print(tenNv)
                vc.initData(session: session)
                    vc.initDataImage(avatarView: avatarView)
                    vc.initMsnv(msNV: msNV)
                    vc.initTenNV(tenNv: tenNv)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)

                case .failure(let err):
                    print(err.localizedDescription)
                let alert = UIAlertController(title: "Thông Báo", message: "Tài khoản hoặc mật khẩu không đúng", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Quay Lại Đăng Nhập", style: UIAlertAction.Style.default, handler: nil))
            }

            
        }
        
    }

}

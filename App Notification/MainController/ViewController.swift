//
//  ViewController.swift
//  App Notification
//
//  Created by namit on 11/6/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import JGProgressHUD
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
        dangnhap.layer.cornerRadius = 30
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
        matKhau.layer.cornerRadius = 30
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
        dangnhap.layer.cornerRadius = 30
        dangnhap.clipsToBounds = true
        
        return dangnhap
    } ()
    let qmkButton: UIButton = {
        let dangnhap = UIButton()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.backgroundColor = UIColor(red:0.980, green:0.980, blue:0.980, alpha: 1.000)
        dangnhap.setTitle("Quên mật khẩu !", for: .normal)
        dangnhap.setTitleColor(UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000), for: .normal)
        dangnhap.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
//        dangnhap.layer.cornerRadius = 40
        return dangnhap
    } ()
    let version: UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Ver 1.0.0"
        welcome.textAlignment = .center
        welcome.textColor = UIColor(red:0.518, green:0.604, blue:1.000, alpha: 1.000)
        welcome.font = UIFont.boldSystemFont(ofSize: 17)
        welcome.numberOfLines = 0
        welcome.layer.shadowColor = UIColor.black.cgColor
        welcome.layer.shadowOffset = CGSize(width: 20, height: 20)
        return welcome
    }()
    
    let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
//        stackview.backgroundColor = UIColor.gray
        stackview.distribution = .fillProportionally
        
        return stackview
    }()
    let margin:CGFloat = 15
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
        containerView.addSubview(stackView)
        stackView.addSubview(dangNhapText)
        stackView.addSubview(matkhatText)
        stackView.addSubview(dangNhapbtnLogin)
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
        welcome.heightAnchor.constraint(equalTo: welcome.heightAnchor).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: setView.centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: setView.centerYAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalTo: setView.widthAnchor, constant: 0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 245).isActive = true
        
        dangNhapText.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10).isActive = true
        dangNhapText.leadingAnchor.constraint(equalTo:stackView.leadingAnchor, constant: margin).isActive = true
        dangNhapText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -margin).isActive = true
        dangNhapText.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        matkhatText.topAnchor.constraint(equalTo: dangNhapText.bottomAnchor, constant: margin).isActive = true
        matkhatText.leadingAnchor.constraint(equalTo:stackView.leadingAnchor, constant: margin).isActive = true
        matkhatText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -margin).isActive = true
        matkhatText.heightAnchor.constraint(equalTo: dangNhapText.heightAnchor, constant: 0).isActive = true
        
        dangNhapbtnLogin.topAnchor.constraint(equalTo: matkhatText.bottomAnchor, constant: 30).isActive = true
        dangNhapbtnLogin.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        dangNhapbtnLogin.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        dangNhapbtnLogin.heightAnchor.constraint(equalTo: dangNhapText.heightAnchor, constant: 0).isActive = true
        
        qmkButton.centerXAnchor.constraint(equalTo: setView.centerXAnchor, constant: 0).isActive = true
        qmkButton.widthAnchor.constraint(equalTo: qmkButton.widthAnchor, constant: 0).isActive = true
        qmkButton.heightAnchor.constraint(equalTo: qmkButton.heightAnchor, constant: 0).isActive = true
        qmkButton.bottomAnchor.constraint(equalTo: version.topAnchor, constant: -10).isActive = true
        
        version.heightAnchor.constraint(equalTo: version.heightAnchor).isActive = true
        version.leadingAnchor.constraint(equalTo:setView.leadingAnchor, constant: margin).isActive = true
        version.trailingAnchor.constraint(equalTo: setView.trailingAnchor, constant: -margin).isActive = true
        version.bottomAnchor.constraint(equalTo: setView.bottomAnchor, constant: -30).isActive = true
        
        
    }
    @objc func qmkBt(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let qmk = storyboard.instantiateViewController(identifier: "ForgetViewController") as! ForgetViewController
        present(qmk, animated: true, completion: nil)
    }
    @objc func btnLogin(){
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
//        if (dangNhapText.text! == "" || matkhatText.text! == ""){
//            hud.dismiss(afterDelay: 0.0)
//            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Thông Tin", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            return;
//        }
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let url = "https://id.mvpapp.vn/api/v1/system/Login"
//        let par = ["username": dangNhapText.text!,
//                   "password": matkhatText.text!]
        let par = ["username": "6006",
                   "password": "170917"]
        AF.request(url, method: .post,parameters: par,encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON{ [weak self]
                response in
            guard let strongSelf = self else {return}
                switch response.result {
                case .success(let value):
                        let json = JSON(value)
                    if json["CODE"].stringValue == "LOGIN_FAILED"{
                       hud.dismiss(afterDelay: 0.0)
                        let alert = UIAlertController(title: "Thông Báo", message: "Tài Khoản Hoặc Mật Khẩu Không Đúng", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
                        strongSelf.present(alert, animated: true, completion: nil)
                        return;
                    }
                    if json["CODE"].stringValue == "SUCCESS"{
                        strongSelf.session = json["session_key"].stringValue
                        strongSelf.avatarView = json["userData"]["avatar"].stringValue
                        strongSelf.msNV = json["userData"]["emp_id"].stringValue
                        strongSelf.tenNv = json["userData"]["name"].stringValue
                        vc.initData(session: strongSelf.session)
                        vc.initDataImage(avatarView: strongSelf.avatarView)
                        vc.initMsnv(msNV: strongSelf.msNV)
                        vc.initTenNV(tenNv: strongSelf.tenNv)
                        vc.modalPresentationStyle = .fullScreen
                        strongSelf.present(vc, animated: true, completion: .none)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    break
                }
            }
    }
}

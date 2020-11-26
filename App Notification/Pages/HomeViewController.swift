//
//  HomeViewController.swift
//  App Notification
//
//  Created by namit on 11/16/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SafariServices

class HomeViewController: UIViewController, SFSafariViewControllerDelegate {
    var session1 = ""
    var ava: String = ""
    var msnv:String = ""
    var tenUser: String = ""
    let host = "https://id.mvpapp.vn/"
    var content = [String]()
    var id = ""
    var link = [String]()
    var tieuDe = [String]()
    var created_at = [String]()
    let margin:CGFloat = 20
    let containerView:UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(red:0.973, green:0.973, blue:0.980, alpha: 1.000)
        return containerView
    }()
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 15
//        tableView.backgroundColor = UIColor(red:0.973, green:0.973, blue:0.980, alpha: 1.000)
        tableView.backgroundColor = .clear
        return tableView
    }()
    let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor(red:0.251, green:0.565, blue:0.796, alpha: 1.000)
        topView.layer.cornerRadius = 15
        return topView
    }()
    let avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
//        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.contentMode = .scaleAspectFill
        return avatarImage
    }()
    let msnvText: UILabel = {
        let msnvLable = UILabel()
        msnvLable.translatesAutoresizingMaskIntoConstraints = false
        msnvLable.textColor = UIColor.blue
        msnvLable.font = UIFont.boldSystemFont(ofSize: 12)
        msnvLable.textAlignment = .right
        return msnvLable
    }()
    let tenUserLabel: UILabel = {
        let msnvLable = UILabel()
        msnvLable.translatesAutoresizingMaskIntoConstraints = false
        msnvLable.textColor = UIColor.blue
        msnvLable.font = UIFont.boldSystemFont(ofSize: 12)
        msnvLable.textAlignment = .right
        return msnvLable
    }()
    let logoutBtn: UIButton = {
        let logout = UIButton()
        logout.translatesAutoresizingMaskIntoConstraints = false
        logout.setTitle("Đăng Xuất", for: .normal)
        logout.setTitleColor(UIColor.blue, for: .normal)
        return logout
    }()
    var uiImage = ""
    let cellSpacingHeight: CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        loadData()
        addSub()
        setLayout()
        avatarImage.kf.setImage(with: URL(string: ava))
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 25
        msnvText.text = "MSNV: \(msnv)"
        tenUserLabel.text = tenUser
        logoutBtn.addTarget(self, action: #selector(dangLogout), for: .touchUpInside)
        
//        MARK: --tạo kẻ line giữa các Cell
        tableView.separatorStyle = .none
//        tableView.backgroundColor = UIColor(red:0.973, green:0.973, blue:0.980, alpha: 1.000)
        
    }
    func addSub(){
        view.addSubview(containerView)
        containerView.addSubview(topView)
        containerView.addSubview(tableView)
        topView.addSubview(avatarImage)
        topView.addSubview(msnvText)
        topView.addSubview(tenUserLabel)
        topView.addSubview(logoutBtn)
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        topView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 34).isActive = true
        topView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin).isActive = true
        topView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        avatarImage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5).isActive = true
        avatarImage.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -5).isActive = true
        avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor,constant: 0).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        msnvText.topAnchor.constraint(equalTo: topView.topAnchor, constant: 15).isActive = true
        msnvText.trailingAnchor.constraint(equalTo: avatarImage.trailingAnchor,constant: -55).isActive = true
        msnvText.widthAnchor.constraint(equalToConstant: 90).isActive = true
        msnvText.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        logoutBtn.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0).isActive = true
        logoutBtn.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10).isActive = true
        logoutBtn.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        logoutBtn.widthAnchor.constraint(equalTo: logoutBtn.widthAnchor).isActive = true
        
        tenUserLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -15).isActive = true
        tenUserLabel.trailingAnchor.constraint(equalTo: avatarImage.trailingAnchor,constant: -55).isActive = true
        tenUserLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        tenUserLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    func initData(session: String){
        self.session1 = session
    }
    @objc func dangLogout(){
        dismiss(animated: true, completion: nil)
    }
    
//    func convertToString (dateString: String, formatIn : String, formatOut : String) -> String {
//        let dateFormater = DateFormatter()
//        dateFormater.timeZone = TimeZone(identifier: "GMT")
//        dateFormater.dateFormat = formatIn
//        let date = dateFormater.date(from: dateString)
//        dateFormater.dateFormat = formatOut
//        let timeStr = dateFormater.string(from: date!)
//        return timeStr
//     }
    func loadData(){
//        let urlNoty = "https://id.mvpapp.vn/api/v1/mvpnotify/getNotify"
//        let para = ["session_key" : session1]
//
        
        
//        MARK: -- test api đổ dữ liệu
        let urlNoty = "https://observant-melon-zebra.glitch.me/getNotification"
        let queue = DispatchQueue.init(label: "queue", qos: .background, attributes: .concurrent)
        queue.async {
            AF.request(urlNoty, method: .post).responseJSON{[weak self]
                response in
                guard let strongSelf = self else{return}
                switch response.result{
                case .success(let object):
                        let json = JSON(object)
                    for item in json["notification"].arrayValue{
                        strongSelf.content.append(item["content"].stringValue)
                        strongSelf.id.append(item["id"].stringValue)
                        strongSelf.link.append(item["link"].stringValue)
                        strongSelf.tieuDe.append(item["title"].stringValue)
                        strongSelf.created_at.append(item["created_at"].stringValue)
                        strongSelf.tableView.reloadData()
                    }
                    case .failure(let err):
                        print(err.localizedDescription)
                }
            }
        }
    }
    func initDataImage(avatarView: String){
        self.ava = host+avatarView
    }
    func initMsnv(msNV: String){
        self.msnv = msNV
    }
    func initTenNV(tenNv:String){
        self.tenUser = tenNv
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//        return tieuDe.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return tieuDe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.selectionStyle = .none
            cell.contentLabel.text = self.content[indexPath.row]
            cell.titleNewLabel.text = self.tieuDe[indexPath.row]
            cell.timerLabel.text = self.created_at[indexPath.row]
            if cell.titleNewLabel.text == "TĂNG CA"{
                cell.avatarTitle.image = UIImage(named: "tangca")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "ĐI TRỄ, VỀ SỚM"{
                cell.avatarTitle.image = UIImage(named: "ditre")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "THỰC ĐƠN"{
                cell.avatarTitle.image = UIImage(named: "thucdon")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "QUY ĐỊNH,THÔNG BÁO"{
                cell.avatarTitle.image = UIImage(named: "quidinh")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "LỊCH LÀM VIỆC"{
                cell.avatarTitle.image = UIImage(named: "lich")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "CHẤM CÔNG"{
                cell.avatarTitle.image = UIImage(named: "fringer")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "NGHỈ PHÉP"{
                cell.avatarTitle.image = UIImage(named: "nghiphep")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "BẢNG CÔNG"{
                cell.avatarTitle.image = UIImage(named: "bangcong")?.withTintColor(UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000))
            }
            if cell.titleNewLabel.text == "Y TẾ"{
                cell.avatarTitle.image = UIImage(named: "yte")?.withTintColor(.red)
            }
            if cell.titleNewLabel.text == "TỈ LỆ THÔI VIỆC"{
                cell.avatarTitle.image = UIImage(named: "thoiviec")?.withTintColor(.red)
            }
        
        
//        let updateDate = convertToString(dateString: "\(created_at[indexPath.row])", formatIn: "yyyy-MM-dd hh:mm:ss", formatOut: "dd-MM-yyyy HH:mm")
//        cell.timerLabel.text = updateDate
        
        return cell
    }
//    MARK: -- tự động giãn cell theo chiều cao
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//    MARK: -- xoá color cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.backgroundColor = .green
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        let urls = link[indexPath!.row]
        if let urlLink = URL(string: urls){
            if #available(iOS 11.0, *){
                let vc = SFSafariViewController(url: urlLink)
                vc.delegate = self
                present(vc, animated: true)
            }else{
                let vc = SFSafariViewController(url: urlLink,entersReaderIfAvailable: true)
                vc.delegate = self
                present(vc, animated: true)
            }
            
        }
    }
}


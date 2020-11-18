//
//  CustomCell.swift
//  App Notification
//
//  Created by namit on 11/10/20.
//

import UIKit

class CustomCell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    let titleNewLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return titleNewLabel
    }()
    
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = UIFont.italicSystemFont(ofSize: 15)
        contentLabel.textColor = UIColor.black
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    let timerLabel: UILabel = {
        let titleNewLabel = UILabel()
        titleNewLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNewLabel.textColor = UIColor.blue
        titleNewLabel.font = UIFont.boldSystemFont(ofSize: 10)
        titleNewLabel.textColor = UIColor(red:0.275, green:0.282, blue:0.298, alpha: 1.000)
        titleNewLabel.textAlignment = .right
        return titleNewLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSub()
        setLayout()
        containerView.backgroundColor = UIColor(red:0.906, green:0.910, blue:0.918, alpha: 1.000)
        
    }
    
    func addSub(){
        self.addSubview(containerView)
        containerView.addSubview(titleNewLabel)
        containerView.addSubview(contentLabel)
        containerView.addSubview(timerLabel)
        containerView.addSubview(titleNewLabel)
        
    }
    func setLayout(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        
        titleNewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        titleNewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        titleNewLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45, constant: 0).isActive = true
        titleNewLabel.heightAnchor.constraint(equalTo:self.heightAnchor,multiplier: 0.3, constant: 0).isActive = true
        
        contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -25).isActive  = true
        contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        contentLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
        contentLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.4, constant: 0).isActive = true
        
        timerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5).isActive  = true
        timerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        timerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45, constant: 0).isActive = true
        timerLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.2, constant: 0).isActive = true
    }
}

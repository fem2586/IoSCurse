//
//  ViewController.swift
//  NavbarAnimation
//
//  Created by Mac on 2020-05-15.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return Snack.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
           let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
           cell.textLabel?.text = Snack[indexPath.row]
           return cell
        }
    
      var Snack = [String]()
      let cellID : String = "cell"
      
      var widthAnchor  : NSLayoutConstraint?
      var heightAnchor : NSLayoutConstraint?
      
      var NormalHeight : NSLayoutConstraint!
      var ExtendedHeightConstraint : NSLayoutConstraint!
    
    
    let navigationBar : UIView = {
        let view1 = UIView()
        view1.backgroundColor = .lightGray
        view1.translatesAutoresizingMaskIntoConstraints = false
        
    return view1
    }()
    
    
    let label: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "SNACK"
        lab.font = .boldSystemFont(ofSize: 15)
        
    return lab
    }()
    
    
    let plusBut : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("＋", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(addSnacks), for: .touchUpInside)
    
    return btn
    }()
   

    let snackStackView: UIStackView = {
        let SnStView = UIStackView()
        SnStView.translatesAutoresizingMaskIntoConstraints = false
        SnStView.axis = .horizontal
        SnStView.distribution = .equalSpacing
        SnStView.isHidden = true
        
        let snackImage = [ "Oreos","Pizza pockets","Pop tarts","Popsicle","Ramen"]
        
        
        for imgView in snackImage {
            let snackButton = UIButton(frame: .zero)
            snackButton.setTitle(imgView, for: .normal)
            snackButton.setImage(UIImage(named: imgView), for: .normal)
            snackButton.addTarget(self, action: #selector(snackButtonPushed), for: .touchUpInside)
            
            SnStView.addArrangedSubview(snackButton)
            snackButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
            snackButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        }
        
    return SnStView
    }()
    
    let SnTableListView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
    return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
               
    }

    fileprivate func setupLayout() {
        
        view.addSubview(navigationBar)
        NormalHeight             = navigationBar.heightAnchor.constraint(equalToConstant: 88)
        ExtendedHeightConstraint = navigationBar.heightAnchor.constraint(equalToConstant: 200)
        NormalHeight.isActive = true
        NSLayoutConstraint.activate([
            navigationBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        view.addSubview(SnTableListView)
        SnTableListView.dataSource = self
        SnTableListView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        NSLayoutConstraint.activate([
            SnTableListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            SnTableListView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            SnTableListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SnTableListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        navigationBar.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor)
        ])
        
        navigationBar.addSubview(plusBut)
        NSLayoutConstraint.activate([
        plusBut.bottomAnchor.constraint(equalTo:   view.topAnchor,      constant: 70),
        plusBut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        plusBut.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        navigationBar.addSubview(snackStackView)
        NSLayoutConstraint.activate([
        snackStackView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor , constant: -5),
        snackStackView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
        snackStackView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor)
        ])
        
    }
    
    
    @objc func snackButtonPushed (_ sender: UIButton){
        Snack.append(sender.title(for: .normal)!)
        SnTableListView.insertRows(at: [IndexPath(row: Snack.count - 1, section: 0)], with: .top)
    }
    
    
    @objc func addSnacks (_ sender: UIButton) {
        if navigationBar.frame.size.height == 88 {
        self.snackStackView.isHidden = false
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.label.text = "ADD SNACK"
            self.NormalHeight.isActive = false
            self.ExtendedHeightConstraint.isActive = true
            self.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height : 200)
            self.SnTableListView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 200)
            self.label.transform = CGAffineTransform(translationX: 0, y: -40)
            self.plusBut.transform = CGAffineTransform(rotationAngle: .pi/4)})
            
        }else{
        self.snackStackView.isHidden = true
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, animations: {
            self.label.text = "SNACK"
            self.label.transform = CGAffineTransform(translationX: 0, y: 14)
            self.ExtendedHeightConstraint?.isActive = false
            self.NormalHeight?.isActive = true
            self.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height : 88)
            self.SnTableListView.frame = CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: self.view.frame.size.height - 88)
            self.plusBut.transform = CGAffineTransform(rotationAngle: 0)})
        }
    }
}

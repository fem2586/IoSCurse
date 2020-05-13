//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
    
  let purpleBox: UIView = {
    let purple = UIView(frame: .zero)
    purple.translatesAutoresizingMaskIntoConstraints = false
    purple.backgroundColor = .purple

    return purple
  }()
  
    
    
    let boxStackView : UIStackView = {
        
     let boxStView = UIStackView()
     boxStView.translatesAutoresizingMaskIntoConstraints = false
     boxStView.axis = .vertical
     boxStView.distribution = .equalSpacing

        for _ in 0..<3 {
            let blueBox = UIView(frame: .zero)
                blueBox.translatesAutoresizingMaskIntoConstraints = false
                blueBox.backgroundColor = .blue
                boxStView.addArrangedSubview(blueBox)
            NSLayoutConstraint.activate([
                blueBox.widthAnchor.constraint(equalToConstant: 60),
                blueBox.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
        
     return boxStView
    }()
    
    let redboxStackView : UIView = {

        let margin: CGFloat = 20
       
        let OrBox1 = UIView(frame: .zero)
        OrBox1.backgroundColor = .orange
        OrBox1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            OrBox1.widthAnchor.constraint(equalToConstant: 80),
            OrBox1.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let OrBox2 = UIView(frame: .zero)
        OrBox2.backgroundColor = .orange
        OrBox2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          OrBox2.widthAnchor.constraint(equalToConstant: 50),
          OrBox2.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let boxStView = UIStackView(arrangedSubviews: [OrBox1,OrBox2])
            boxStView.translatesAutoresizingMaskIntoConstraints = false
            boxStView.axis = .horizontal
            boxStView.distribution = .fill
            boxStView.spacing = margin
    
        let BackgroundBox = UIView(frame: .zero)
            BackgroundBox.backgroundColor = .red
            BackgroundBox.translatesAutoresizingMaskIntoConstraints = false
            BackgroundBox.addSubview(boxStView)
            
        NSLayoutConstraint.activate([
            BackgroundBox.widthAnchor.constraint(equalToConstant: 130 + margin * 3),
            BackgroundBox.heightAnchor.constraint(equalToConstant: 40 + margin * 2),
            boxStView.centerXAnchor.constraint(equalTo: BackgroundBox.centerXAnchor),
            boxStView.centerYAnchor.constraint(equalTo: BackgroundBox.centerYAnchor)
            ])
        
            
     return BackgroundBox
    }()
    
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    mainView.addSubview(redboxStackView)
    NSLayoutConstraint.activate([
        redboxStackView.widthAnchor.constraint(equalToConstant: 200),
        redboxStackView.heightAnchor.constraint(equalToConstant: 60),
        redboxStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
        redboxStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
    ])
    
    mainView.addSubview(purpleBox)
       NSLayoutConstraint.activate([
           purpleBox.heightAnchor.constraint(equalToConstant: 50),
           purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
           purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
           purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
       ])
    
    mainView.addSubview(boxStackView)
   NSLayoutConstraint.activate([
     boxStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
     boxStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
     boxStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.8),
     boxStackView.widthAnchor.constraint(equalToConstant: 60)

     ])
        
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}


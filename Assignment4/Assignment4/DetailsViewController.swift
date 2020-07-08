//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Mac on 2020-06-28.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var city: City!

    let stackView : UIStackView = {
        let verticalStView = UIStackView()
        verticalStView.axis = .vertical
        verticalStView.distribution = .equalSpacing
        verticalStView.translatesAutoresizingMaskIntoConstraints = false
        verticalStView.alignment = .center
    
        return verticalStView
    }()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        let countryL = UILabel()
        countryL.text = "Country"
            
        let countryImage = UILabel()
        countryImage.text = city.icon

        let cityTitle = UILabel()
        cityTitle.text = "City"
        let cityLabel = UILabel()
        cityLabel.text = city.name


        let temperatureTitle = UILabel()
        temperatureTitle.text = "Temperature"
        let temperatureLabel = UILabel()
        temperatureLabel.text = String(city.temp)


        let sumTitle = UILabel()
        sumTitle.text = "Summary"
        let summaryLabel = UILabel()
        summaryLabel.text = city.summary
           
        view.backgroundColor = .white
    
        stackView.addArrangedSubview(countryL)
        stackView.addArrangedSubview(countryImage)
        stackView.addArrangedSubview(cityTitle)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(temperatureTitle)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(sumTitle)
        stackView.addArrangedSubview(summaryLabel)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    
  

}

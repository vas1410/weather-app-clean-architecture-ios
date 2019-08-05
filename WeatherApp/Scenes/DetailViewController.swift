//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import UIKit
import Domain
class DetailViewController: UIViewController,AbstractWeatherViewController {
    var input: AbstractWeatherPresenter?
    
    var output: AbstractWeatherInteractor?
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblObservationTime: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    
    
    var city : City?
    
    var vm : WeatherViewModel? {
        
        didSet{
             guard let viewModel = vm else { return }
            
            lblTemp.text = viewModel.temp
            lblHumidity.text = viewModel.humidity
            lblDescription.text = viewModel.description
            lblObservationTime.text = viewModel.observationTime
            imgWeather.imgIcon(viewModel.iconUrl ?? "")
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let city = city else{
            
            return
        }
        WeatherConfigurator.shared.configure(for: self)
        output?.fetchWeather(on: .today, for: city, completion: { [weak self] (result) in
           let vm =  self?.input?.presentWeather(with: result, and: city)
           print("vm",vm?.iconUrl ?? "")
           self?.vm = vm
        })
        
        
    }

}



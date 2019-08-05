//
//  WeatherConfigurator.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation
import UIKit
import Domain
import PresenterLayer
import BusinessLayer
import DataLayer
protocol AbstractViewController:UIViewController {
    
}


protocol AbstractWeatherViewController{
    var input:AbstractWeatherPresenter?{get set}
    var output:AbstractWeatherInteractor?{get set}
    
}

class WeatherConfigurator{
    static var shared = WeatherConfigurator()
    
    public func configure(for viewcontroller:AbstractWeatherViewController?){
        guard var vc = viewcontroller else{
            return
        }
        let worker:WeatherUsecase = WeatherWorker()
        let interactor:AbstractWeatherInteractor = WeatherInteractor(worker: worker)
        let presenter:AbstractWeatherPresenter = WeatherPresenter()
        
        vc.input = presenter
        vc.output = interactor
    }
    
}

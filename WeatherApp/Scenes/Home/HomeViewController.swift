//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    @IBOutlet weak var hourlyWeatherCollectionView: UICollectionView!
    @IBOutlet weak var weaklyWeatherTableView: UITableView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var windStrengthLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var uvLabel: UILabel!
    
    
    
    let citiesCollectionViewDataSource = CitiesCollectionViewDataSource()
    let hourlyWeatherCollectionViewDataSource = HourlyWeatherCollectionViewDataSource()
    
    // MARK: - LifeCycle
    
    override func initView() {
        super.initView()
        
        self.barTitle = "home_title".localized
        
//        citiesCollectionView.delegate = citiesCollectionViewProvider
//        citiesCollectionView.dataSource = citiesCollectionViewProvider
        
    
    }
    
    override func initVM() {
        super.initVM()

        viewModel.fetchData = { [weak self] (data) in
            
            // Yalnızca ilk değer
            guard let weather = data.first else { return }
            
            self?.updateView(weather)
            
        }
        
        viewModel.showError = { [weak self] (message) in
            
            self?.showError(errorMessage: message)
        }
        
        viewModel.initFetch()
    }
    
    func updateView(_ weather: WeatherModel) {
        
        self.weatherTempLabel.text = weather.main.temp.toCelsius + "C"
        self.maxTempLabel.text = weather.main.maxTemp.toCelsius
        self.minTempLabel.text = weather.main.minTemp.toCelsius
        self.weatherDescriptionLabel.text = weather.detail
        self.currentDateLabel.text = String(weather.date.description.split(separator: " ")[0])
        self.windStrengthLabel.text = "\(String(weather.windSpeed)) mhs/s"
        self.humidityLabel.text = "%\(String(weather.main.huminity))"
        self.visibilityLabel.text = "\(String(Float(weather.visibility)/1000.0)) km"
        self.uvLabel.text = "0.0"
        
        switch weather.weatherType {
        case .rain:
            weatherImage.image = #imageLiteral(resourceName: "rainy")
        case .clear:
            weatherImage.image = #imageLiteral(resourceName: "sunny")
        case .clouds:
            weatherImage.image = #imageLiteral(resourceName: "homeStatusBarIcon")
        case .extreme:
            weatherImage.image = #imageLiteral(resourceName: "stormy")
        case .snow:
            weatherImage.image = #imageLiteral(resourceName: "snowy")
        case .none:
            weatherImage.image = #imageLiteral(resourceName: "sunny")
        }
    }
}


extension Float {
    var toCelsius: String {
        get {
            return "\(Int((Double(self) - 273.15)))°"
        }
    }
}

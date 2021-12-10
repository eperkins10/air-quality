//
//  CityDataViewController.swift
//  AirQuality
//
//  Created by Ethan Perkins on 12/2/21.
//

import UIKit

class CityDataViewController: UIViewController {
    
    @IBOutlet weak var cityStateCountryLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    @IBOutlet weak var wsLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var latLongLabel: UILabel!
    
    
    var country: String?
    var state: String?
    var city: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCityData()
        
    }
    
    func fetchCityData() {
        guard let city = city, let state = state, let country = country else { return }
        AirQualityController.fetchData(forCity: city, inState: state, inCountry: country) { (result) in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let cityData):
                    self.updateViews(with: cityData)
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")                }
            }
        }
    }
    
    func updateViews(with cityData: CityData) {
        let data = cityData.data
        
        cityStateCountryLabel.text = "\(data.city), \(data.state), \(data.country)"
        
        aqiLabel.text = "AQI: \(data.current.pollution.aqius)"
        
        wsLabel.text = "Windspeed: \(data.current.weather.ws)"
        
        tempLabel.text = "Temperature: \(data.current.weather.tp)"
        
        humidityLabel.text = "Humidity: \(data.current.weather.hu)"
        
        let coordinates = data.location.coordinates
        if coordinates.count == 2 {
            latLongLabel.text = "Lat: \(coordinates[1]) \nLong: \(coordinates[0]) "
        } else {
            latLongLabel.text = "Coordinates Unknown"
        }
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}

//
//  ViewController.swift
//  WeatherApp
//
//  Created by vasanth on 3/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import UIKit
import Domain

var allCityArr = ["Singapore", "London", "Bangkok", "Hcm", "Kualampur", "Beijing", "Chennai", "Hague", "Bangalore"]
var recentVisitCities = ["Singapore"]

class ViewController: UIViewController {
    var city : City?
    @IBOutlet weak var tableview: UITableView!
    
    var filteredCities:[String] = []
    var viewM : WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = true
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
        

        tableview.delegate = self
        tableview.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = allCityArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        city = City(name: allCityArr[indexPath.row])
       
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.city = city
         self.navigationController?.pushViewController(detailController, animated: false)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//         city = City(name: allCityArr[indexPath.row])
////    let worker = WeatherWorker()
////        worker.fetchWeather(on: .today, for: city) { result in
////            viewM = result.map{ return $0 }
//        }
   
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? DetailViewController {
//            vc.cityName = city
//        }
//    }

 }

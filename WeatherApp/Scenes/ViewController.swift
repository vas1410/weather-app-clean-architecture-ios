//
//  ViewController.swift
//  WeatherApp
//
//  Created by vasanth on 3/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import UIKit
import Domain

//var recentVisitCities = [String]()
var tableArray :[String]?

class ViewController: UIViewController {
    var city : City?
    @IBOutlet weak var tableview: UITableView!
    
    var detailViewController: WeatherDetailViewController? = nil
    var cities = [String]()
    var filteredCities:[String] = []
    let search = UISearchController(searchResultsController: nil)
    
    var  recentVisitCities :[String] = []{
        didSet{
            tableview.reloadData()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search by Cities"
        navigationItem.searchController = search
        search.searchBar.delegate = self
        definesPresentationContext = true
        tableview.delegate = self
        tableview.dataSource = self
        
        if let arr = defaults.array(forKey: "RecentVistedCitiesArr") as? [String]{
            recentVisitCities = arr
        }
        
    }

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCities.count
        }
        return recentVisitCities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityName = isFiltering() ? filteredCities[indexPath.row] : recentVisitCities[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cityName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        city =  isFiltering() ? City(name: filteredCities[indexPath.row]) : City(name:recentVisitCities[indexPath.row])
        if let cityName =  city?.name {
            recentVisitCities.insert(cityName, at: 0)
            recentVisitCities.removeDuplicates()
            
            if recentVisitCities.count > 3 {
                recentVisitCities.removeLast()
            }
            defaults.set(recentVisitCities, forKey: "RecentVistedCitiesArr")
        }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailController = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        detailController.city = city
        self.navigationController?.pushViewController(detailController, animated: false)
    }
    
}


extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filterCity(text)
    }
    
    func filterCity(_ searchText: String) {
        filteredCities = cityList.filter {$0.lowercased().contains(searchText.lowercased())}
        tableview.reloadData()
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = search.searchBar.selectedScopeButtonIndex != 0
        return search.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    func searchBarIsEmpty() -> Bool {
        return search.searchBar.text?.isEmpty ?? true
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterCity(searchBar.text ?? "")
    }
}

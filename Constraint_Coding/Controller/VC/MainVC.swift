//
//  MainVC.swift
//  Constraint_Coding
//
//  Created by Islomjon on 29/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainVC: UIViewController {
    
    var countries:[CountryDM] = []
    var allCountries:[CountryDM] = []
    
    var tableView: UITableView = {
        let t = UITableView()
        t.clipsToBounds = true
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "World country"
        navigationController?.navigationBar.prefersLargeTitles = true
        setNavigation()
        searchNavBar()
        setUI()
        getData()
    }
    
    func setUI(){
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(CountryTVC.self, forCellReuseIdentifier: CountryTVC.identifier)
    }
    
    func setNavigation(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.cyan
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func searchNavBar(){
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search country"
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    
    func getData(){
        if Reachability.isConnectedToNetwork() {
            AF.request(Url.allCountry, method: .get).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    for i in json.arrayValue {
                        let country = CountryDM(country: i)
                        self.countries.append(country)
                    }
                }
                self.tableView.reloadData()
            }
        }else{
            print("Waiting network 🙁 ")
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource -
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTVC.identifier, for: indexPath) as? CountryTVC else {
            return UITableViewCell()
        }
        cell.updateCell(country: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoVC()
        vc.country = countries[indexPath.row].name
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}

//MARK: - UISearchBarDelegate -
extension MainVC: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        allCountries = countries
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchBar.showsCancelButton = true
        countries = searchText.isEmpty ? countries : countries.filter({ $0.name.range(of: searchText, options: .caseInsensitive) != nil })
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        countries = allCountries
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}

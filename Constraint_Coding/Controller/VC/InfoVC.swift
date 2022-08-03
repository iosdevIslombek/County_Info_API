//
//  InfoVC.swift
//  Constraint_Coding
//
//  Created by Islomjon on 30/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class InfoVC: UIViewController {
    
    var map:String = ""
    var country:String = ""
    
    let containerView: UIView = {
        let v = UIView()
        v.clipsToBounds = true
        v.layer.cornerRadius = 8
        v.backgroundColor = .cyan
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let countryLbl: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let languageLbl: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 19)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let areaLbl: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 19)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let populationLbl: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 19)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let regionLbl: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let subregionLbl: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let mapBtn: UIButton = {
        let map = UIButton()
        map.setTitle("View on map", for: .normal)
        map.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        map.setTitleColor(UIColor.white, for: .normal)
        map.backgroundColor = .systemGreen
        map.layer.cornerRadius = 8
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    let vStack: UIStackView = {
        let vs = UIStackView()
        vs.translatesAutoresizingMaskIntoConstraints = false
        vs.axis = .vertical
        vs.alignment = .center
        vs.distribution = .fill
        vs.spacing = 8
        return vs
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Back", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        getData()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            self.view.backgroundColor = .gray.withAlphaComponent(0.85)
            self.containerView.transform = .identity
        } completion: { _ in }

    }
    
    func getData(){
        print(country)
        print("\(Url.country)/\(country)")
        if Reachability.isConnectedToNetwork() {
            AF.request("\(Url.country)/\(country)", method: .get).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    let country = CountryDM(country: json[0])
                    self.countryLbl.text = country.name+country.flag
                    self.regionLbl.text = country.info.regionString
                    self.subregionLbl.text = country.info.subregionString
                    self.areaLbl.text = country.info.areaString
                    self.populationLbl.text = country.info.populationString
                    self.languageLbl.text = country.info.languagesString
                    self.map = country.info.map
                }
            }
        }else{
            print("Waiting network 🙁 ")
        }
    }
    
    func setUI(){
        
        self.view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ])
        
        containerView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            vStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            vStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
        ])
        
        vStack.addArrangedSubview(countryLbl)
        vStack.addArrangedSubview(regionLbl)
        vStack.addArrangedSubview(subregionLbl)
        vStack.addArrangedSubview(areaLbl)
        vStack.addArrangedSubview(populationLbl)
        vStack.addArrangedSubview(languageLbl)
        vStack.addArrangedSubview(mapBtn)
        vStack.addArrangedSubview(backBtn)
        
        NSLayoutConstraint.activate([
            mapBtn.heightAnchor.constraint(equalToConstant: 50),
            mapBtn.leadingAnchor.constraint(equalTo: vStack.leadingAnchor, constant: 0),
            mapBtn.trailingAnchor.constraint(equalTo: vStack.trailingAnchor, constant: 0),
            
            backBtn.heightAnchor.constraint(equalToConstant: 50),
            backBtn.leadingAnchor.constraint(equalTo: vStack.leadingAnchor, constant: 0),
            backBtn.trailingAnchor.constraint(equalTo: vStack.trailingAnchor, constant: 0),
        ])
        
        mapBtn.addTarget(self, action: #selector(mapTapped), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        containerView.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.view.backgroundColor = .clear
    }
    
    @objc func backTapped(){
        UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0.6, options: [.curveEaseIn]) {
            self.view.backgroundColor = .gray.withAlphaComponent(0)
            self.containerView.transform = .identity
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    @objc func mapTapped(){
        let vc = MapVC()
        vc.mapCounytry = map
        present(vc, animated: true)
    }
}

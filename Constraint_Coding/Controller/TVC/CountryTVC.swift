//
//  CountryTVC.swift
//  Constraint_Coding
//
//  Created by Islomjon on 30/07/22.
//

import UIKit

class CountryTVC: UITableViewCell {
    
    static let identifier: String = "CountryTVC"
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        return view
    }()
    
    let countryLbl:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let capitalLbl:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let flagLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageV: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "chevron.right")
        imgView.tintColor = .darkGray
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let hStackView: UIStackView = {
        let hs = UIStackView()
        hs.axis = .horizontal
        hs.alignment = .fill
        hs.distribution = .fill
        hs.spacing = 5
        hs.translatesAutoresizingMaskIntoConstraints = false
        return hs
    }()
    
    let vStackView: UIStackView = {
        let vs = UIStackView()
        vs.axis = .vertical
        vs.alignment = .fill
        vs.distribution = .fill
        vs.spacing = 5
        vs.translatesAutoresizingMaskIntoConstraints = false
        return vs
    }()
    
    let stackView: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .equalSpacing
        s.spacing = 8
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(vStackView)
        stackView.addArrangedSubview(hStackView)
        
        vStackView.addArrangedSubview(countryLbl)
        vStackView.addArrangedSubview(capitalLbl)
        
        hStackView.addArrangedSubview(flagLbl)
        hStackView.addArrangedSubview(imageV)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUI()
    }
    
    func setUI(){
        
        containerView.clipsToBounds = true
        
        layer.cornerRadius = 5
        layer.masksToBounds = false
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
        ])
        
    }
    
    func updateCell(country: CountryDM) {
        self.countryLbl.text = country.name
        self.capitalLbl.text = country.capital
        self.flagLbl.text = country.flag
    }

}

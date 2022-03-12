//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/4.
//

import UIKit
import SnapKit

class WeatherCell: UITableViewCell {

    // MARK: - Properties
    
    // MARK: - UIElements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.text = "Taiwan"
        label.textColor = .black
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.text = "37"
        label.textColor = .darkGray
        return label
    }()
    
    let backgroundCustomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - Autolayout
    private func setConstraints() {
        contentView.addSubview(backgroundCustomView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(temperatureLabel)
        
        backgroundCustomView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundCustomView).offset(10)
            make.left.equalTo(backgroundCustomView).offset(10)
            make.bottom.equalTo(backgroundCustomView).offset(-10)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundCustomView).offset(10)
            make.right.equalTo(backgroundCustomView).offset(-20)
            make.bottom.equalTo(backgroundCustomView).offset(-10)
        }
    }
        
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(_ vm: WeatherViewModel) {
        titleLabel.text = vm.city
        temperatureLabel.text = vm.temperature.formatAsDegree
    }
    

}

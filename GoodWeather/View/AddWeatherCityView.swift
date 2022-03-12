//
//  AddWeatherCityView.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/5.
//

import UIKit

class AddWeatherCityView: UIView {

    // MARK: - Properties
    
    var saveCityBtnClosure: (()->Void)?
    
    // MARK: - UIElements
    let textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.layer.cornerRadius = 5
        tf.layer.shadowColor = UIColor.darkGray.cgColor
        tf.layer.shadowOffset = CGSize(width: 5, height: 5)
        tf.layer.shadowOpacity = 0.7
        tf.layer.shadowRadius = 20
        return tf
    }()
    
    lazy var saveBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(saveCityBtnPressed), for: .touchUpInside)
        return btn
    }()

    // MARK: - Autolayout
    private func setConstraints() {
        addSubview(textField)
        addSubview(saveBtn)
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(50)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        saveBtn.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(40)
            make.centerX.equalTo(self)
        }
    }
        
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    @objc func saveCityBtnPressed() {
        saveCityBtnClosure?()
    }
    
}

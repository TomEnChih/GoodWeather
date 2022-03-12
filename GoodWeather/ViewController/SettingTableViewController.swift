//
//  SettingTableViewController.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/12.
//

import UIKit

protocol SettingDelegate: NSObject {
    func settingDone(vm: SettingViewModel)
}

class SettingTableViewController: UIViewController {
    
    // MARK: - Properties
    private let settingViewModel = SettingViewModel()
    
    weak var delegate: SettingDelegate?
    
    // MARK: - UIElements
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    // MARK: - Methods
    private func setView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Setting"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp_topMargin)
            make.left.right.bottom.equalTo(self.view)
        }
    }
    
    @objc
    private func done() {
        delegate?.settingDone(vm: settingViewModel)
        self.dismiss(animated: true, completion: nil)
    }
    
}


// MARK: - Table view data source
extension SettingTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let settingItem = settingViewModel.units[indexPath.row]
        cell.textLabel?.text = settingItem.displayName
        
        if settingItem == settingViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = settingViewModel.units[indexPath.row]
            settingViewModel.selectedUnit = unit
        }
    }
    
    
}

//
//  ViewController.swift
//  WProficiencyTest
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    let refresButton = UIButton()
    var canada = Canada()
    var isLoading: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)

        commonInit()
        setupConstraint()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }

    func commonInit() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(ViewController.refresh))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    func setupConstraint() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        let viewsDictionary = ["tableView": tableView, "button": refresButton]
        let constraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let constraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        view.addConstraints(constraintH)
        view.addConstraints(constraintV)
    }
    
    //MARK: Load Data
    func loadData() {
        isLoading = true
        PhotoRequest.downloadData {
            [weak self]
            (canada, error) in
            if let strongSelf = self {
                
                if let canada = canada {
                    strongSelf.canada = canada
                }
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                }
                
                strongSelf.isLoading = false
            }
        }
    }

    //MARK: Table View Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return canada.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PhotoTableViewCell
        if let rows = self.canada.rows {
            if indexPath.row < rows.count {
                cell.reloadData(photo: rows[indexPath.row])
            }
        }
        return cell
    }
    
    //MARK: Actions

    @objc func refresh() {
        if isLoading {
            //here shold be a Toast Say "Data is loading..."
            print("Data is loading!!🧐")
        } else {
            loadData()
        }
    }

}


//
//  PlacesTableViewController.swift
//  StarbucksCCH
//
//  Created by Silvio Bulla on 25/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    var dataArray = [Place]()
    
    //TODO: View state managing.
    
    var viewState: ViewState = .ok
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        //MARK:- Use this mock array in case of an expired google map API-KEY
        /*var mockPlace = Place()
        mockPlace.name = "Mock Starbucks"
        mockPlace.formatted_address = "Mock Starbucks address"
        dataArray = [mockPlace, mockPlace,mockPlace, mockPlace, mockPlace, mockPlace, mockPlace, mockPlace, mockPlace]
        */
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setUpView(){
        self.title = "Starbucks"
        setupTableView()
        guard let refreshControl = refreshControl else {return}

        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        refreshControl.tintColor = UIColor.StarbucksGreen
    }
    
    @objc private func getData() {
        let city = "bonn"
        let url = Config.baseUrl + ApiAddesses.placeSearchUrl + "starbucks+\(city)" + ApiAddesses.sensorKey + ApiAddesses.key
        ApiManager().getData(urlString: url) { (success, data: [Place]) in
            if success {
                self.viewState = .ok
                self.dataArray = data
            }else {
                self.viewState = .error
                self.createErrorRetrievingDataAlertwithError(error: "")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                guard let refreshControl = self.refreshControl else {return}
                refreshControl.endRefreshing()
            }
        }
    }
    
    func createErrorRetrievingDataAlertwithError(error:String){
        let alertController = self.createAlertWithTitle(title: "Oops", andMessage: "Something went wrong")
        let retryAction = UIAlertAction(title: "Retry", style: .default, handler: {
            (action:UIAlertAction) in
            self.getData()
        })
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: PlacesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlacesTableViewCell.identifier)
        self.tableView.register(UINib(nibName: ErrorTableViewCell.identifier, bundle:nil), forCellReuseIdentifier: ErrorTableViewCell.identifier)
        self.tableView.refreshControl = refreshControl
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = viewState == .ok ? .singleLine : .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewState == .ok ? dataArray.count : 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard self.viewState == .ok else {
            return tableView.frame.width
        }
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !dataArray.isEmpty else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ErrorTableViewCell.identifier, for: indexPath) as! ErrorTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier, for: indexPath) as! PlacesTableViewCell
        cell.setUpCell(dataArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = UIStoryboard.detailViewController
        let place = dataArray[indexPath.row]
        detailsVC.place = place
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}

//
//  JsonPlaceHolderViewController.swift
//  MvvmAlamofire
//
//  Created by Mehmet Ergün on 2022-06-16.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController{
    @IBOutlet weak var jsonPlaceHolderTableView: UITableView!
    
    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService : JsonPlaceHodlerProtocol = JsonPlaceHolderService()

    override func viewDidLoad() {
        super.viewDidLoad()

        initDelegate()
        initService()
    }
    
   private func initDelegate() {
        
        jsonPlaceHolderTableView.delegate = jsonTableView
        jsonPlaceHolderTableView.dataSource = jsonTableView
        jsonTableView.delegate = self
    }
    
    private func initService() {
        jsonService.fetchData { [weak self] models in
            self?.jsonTableView.update(items: models)
            self?.jsonPlaceHolderTableView.reloadData()
        }onFail: { data in
            print(data)
        }
    }
    
}

extension JsonPlaceHolderViewController: JsonTableViewOutput {
    
    func onSelected(items: PostModel) {
        print(items.body ?? "")
    }
    
}

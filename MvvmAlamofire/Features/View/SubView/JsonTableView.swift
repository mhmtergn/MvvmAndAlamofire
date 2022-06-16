//
//  JsonTableView.swift
//  MvvmAlamofire
//
//  Created by Mehmet Ergün on 2022-06-16.
//

import UIKit

protocol JsonTableViewProtocol {
    
    func update(items: [PostModel])

}

protocol JsonTableViewOutput: class {
    
    func onSelected(items: PostModel)
    
}

class JsonTableView: NSObject {

    private lazy var items: [PostModel] = [] // lazy demek runtime zamaninda deger alsin demek. Performans acisindan onemli aslinda bu keyword

    weak var delegate: JsonTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(items: items[indexPath.row])
    }
}

extension JsonTableView: UITableViewDelegate, UITableViewDataSource { }
extension JsonTableView: JsonTableViewProtocol {
    func update(items: [PostModel]) {
        self.items = items
    }
}

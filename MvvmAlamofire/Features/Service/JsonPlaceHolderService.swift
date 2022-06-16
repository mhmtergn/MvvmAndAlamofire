//
//  JsonPlaceHolderService.swift
//  MvvmAlamofire
//
//  Created by Mehmet Ergün on 2022-06-17.
//

import Foundation
import Alamofire

protocol JsonPlaceHodlerProtocol {
    
    func fetchData(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void)
    
}

enum JsonPlaceHolderPath: String {
    
    case Posts = "/Posts"
    
}

extension JsonPlaceHolderPath {
    func withBaseUrl() -> String {
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}

struct JsonPlaceHolderService: JsonPlaceHodlerProtocol {
    func fetchData(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.Posts.withBaseUrl(), method: .get).validate().responseDecodable(of: [PostModel].self) { response in
            
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    
    
    
}

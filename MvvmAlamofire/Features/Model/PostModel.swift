//
//  PostModel.swift
//  MvvmAlamofire
//
//  Created by Mehmet Ergün on 2022-06-16.
//

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let userID, id: Int?
    let title, body: String?
}


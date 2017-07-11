//
//  ProfileRepository.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation
import Alamofire

typealias UserCompletionClosure = (User?, Error?) -> Void

protocol ProfileRepository {
    
    func getUser(by userId: String, completion: @escaping UserCompletionClosure)
}

struct DefaultProfileRepository: ProfileRepository {
    
    internal func getUser(by userId: String, completion: @escaping UserCompletionClosure) {
        
        Alamofire.request("https://api.myjson.com/bins/afe5r").responseJSON { response in
            
            if let json = response.value as? [String: Any],
                let user = User(json: json) {
                
                completion(user, nil)
                
            } else {
                
                completion(nil, response.error)
            }
        }
    }
}

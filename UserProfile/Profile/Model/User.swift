//
//  User.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct User {
    
    let firstName: String
    let lastName: String
    let career: String
    let email: String
    let phone: Int
    let web: String
    let github: String
    let picture: String
    let about: String
    let skills: [Skill]
}

extension User {
    
    init?(json: [String: Any]) {
        
        guard let firstName = json["firstName"] as? String,
            let lastName = json["lastName"] as? String,
            let career = json["career"] as? String,
            let email = json["email"] as? String,
            let phone = json["phone"] as? Int,
            let web = json["web"] as? String,
            let github = json["github"] as? String,
            let picture = json["picture"] as? String,
            let about = json["about"] as? String,
            let skillsJSON = json["skills"] as? [SkillJSON] else {
                
            return nil
        }
        
        var skills: [Skill] = []
        for skill in skillsJSON {
            
            guard let skill = Skill(json: skill) else {
                
                return nil
            }
            
            skills.append(skill)
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.career = career
        self.email = email
        self.phone = phone
        self.web = web
        self.github = github
        self.picture = picture
        self.about = about
        self.skills = skills
    }
}

//
//  UserFirestore.swift
//  doorian
//
//  Created by Samitanun Sapsukdee on 10/2/2566 BE.
//

import Foundation
import FirebaseFirestoreSwift

struct UserFirestore: Identifiable, Codable{
    @DocumentID var id: String?
    
    var name: String
    var email: String
  
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        
    }
}


import Foundation


struct UserResponse : Codable {
    
    let info : Info?
    let results : [Result]?
}

struct Result : Codable {
    
    let cell : String?
    let dob : Dob?
    let email : String?
    let gender : String?
    let id : Id?
    let location : Location?
    let login : Login?
    let name : Name?
    let nat : String?
    let phone : String?
    let picture : Picture?
    let registered : Registered?
    
}


struct Registered : Codable {
    
    let age : Int?
    let date : String?
}

struct Picture : Codable {
    
    let large : String?
    let medium : String?
    let thumbnail : String?
    
}

struct Name : Codable {
    
    let first : String?
    let last : String?
    let title : String?
}

struct Login : Codable {
    
    let md5 : String?
    let password : String?
    let salt : String?
    let sha1 : String?
    let sha256 : String?
    let username : String?
    let uuid : String?
}

struct Location : Codable {
    
    let city : String?
    let coordinates : Coordinate?
    let state : String?
    let street : String?
    let timezone : Timezone?
}

struct Timezone : Codable {
    
    let descriptionField : String?
    let offset : String?
}

struct Coordinate : Codable {
    
    let latitude : String?
    let longitude : String?
}

import Foundation

struct Id : Codable {
    
    let name : String?
    let value : String?
}

struct Dob : Codable {
    
    let age : Int?
    let date : String?
}

struct Info : Codable {
    
    let page : Int?
    let results : Int?
    let seed : String?
    let version : String?
}

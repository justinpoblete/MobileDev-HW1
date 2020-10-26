//Justin Poblete
//CWID: 8900222474
//Homework 1
//10/25/2020


import Kitura
import Cocoa
import Foundation

let router = Router()

router.all("/ClaimService/add", middleware: BodyParser())

router.get("ClaimService/getAll"){
    request, response, next in
    let cList = ClaimDao().getAll()
    // JSON Serialization
    let jsonData : Data = try JSONEncoder().encode(cList)
    //JSONArray 
    let jsonStr = String(data: jsonData, encoding: .utf8)
    // set Content-Type
    response.status(.OK)
    response.headers["Content-Type"] = "application/json"
    response.send(jsonStr)
    // response.send("getAll service response data : \(pList.description)")
    next()
}

router.post("ClaimService/add") {
    request, response, next in
    // JSON deserialization on Kitura server 
    let body = request.body
    let jObj = body?.asJSON //JSON object
    if let jDict = jObj {
        if let title = jDict["title"],let date = jDict["date"]{
            let uuid = UUID().uuidString
            let cObj = Claim(a: uuid, b: title as? String, c: date as? String, d: 0)
            ClaimDao().addClaim(cObj: cObj)
        }
    }
    response.send("The claim record was successfully inserted (via POST Method).")
    next()
}

Kitura.addHTTPServer(onPort: 8020, with: router)
Kitura.run()


//
//  ActivityTest.swift
//  Fisu
//
//  Created by Djeneba KANE on 11/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import XCTest
@testable import Fisu

class ActivityTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testActivtyInsert()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        ///- l'insertion d'une nouvelle activity
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        let activite1 = Activity.insertNewActivity(moc, id: 100, nom: "Open Ceremony", desc: "Speech about FISU and all events", dateD: "04/07/2016, 09:00", dateF: "04/07/2016, 12:30", lieu: nil, speak: nil, photo: "ceremony", day: day8, selected: false)
        XCTAssertNotNil(activite1, "L'insertion de activite1 c'est bien passee")
       let activite2 = Activity.insertNewActivity(moc, id: 100, nom: "Open Ceremony", desc: "Speech about FISU and all events", dateD: "04/07/2016, 09:00", dateF: "04/07/2016, 12:30", lieu: nil, speak: nil, photo: "ceremony", day: day8, selected: false)
        
        
        ///- Si jamais on insere une activity qui a deja ete insere, il n y pas d erreur ni de nouvelle insertion: l'activity qui avait ete insere est juste retourne
        XCTAssertEqual(activite1, activite2, "Le dactivite1 et le activite2 correspondent au meme activity")
        
    }
    
    
    func testgetDay()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        
        let activite1 = Activity.insertNewActivity(moc, id: 100, nom: "Open Ceremony", desc: "Speech about FISU and all events", dateD: "04/07/2016, 09:00", dateF: "04/07/2016, 12:30", lieu: nil, speak: nil, photo: "ceremony", day: day8, selected: false)
        
        ///- permet de recuperer le day correspondant a activite1
    
            XCTAssertEqual(activite1!.getDay(),"Monday, July 4, 2016")
        
    }
    
    func testConvertStringToNSDate()
    {
        
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        
        let activite1 = Activity.insertNewActivity(moc, id: 100, nom: "Open Ceremony", desc: "Speech about FISU and all events", dateD: "04/07/2016, 09:00", dateF: "04/07/2016, 12:30", lieu: nil, speak: nil, photo: "ceremony", day: day8, selected: false)
        let hr = "04/07/2016, 09:00"
        
        let nsD = Activity.convertStringToNSDate(hr)
        
         XCTAssertEqual(activite1!.getTimeDeb(),nsD)
        
    }

    
}

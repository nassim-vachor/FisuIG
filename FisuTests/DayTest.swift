//
//  DayTest.swift
//  Fisu
//
//  Created by Djeneba KANE on 10/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import XCTest
@testable import Fisu

class DayTest: XCTestCase {
    
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
    
    func testDayInsert()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        ///- l'insertion d'un nouveau day
        XCTAssertNotNil(day8, "L'insertion de Day8 c'est bien passee")
         let day9 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        ///- Si jamais on insere un day qui a deja ete insere, il n y pas d erreur ni de nouvelle insertion: le day qui avait ete insere est juste retourne
        XCTAssertEqual(day8, day9, "Le day8 et le day9 correspondent au meme Day")
         
    }
    
    func testGetActivityFetchedResultController()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        let activityDay8 = Day.getActivityFetchedResultController("Activity", key: "idAct", predicat: "dayIs=%@", args: (day8)!)
            XCTAssertNil(activityDay8.sections, "il n ya pas d activite pour Day8")
        
    }
    
    func testGetDayFetchedResultController()
    {
        
        let frc = Day.getDayFetchedResultController("Day", key: "keyDay")
        XCTAssertNotNil(frc)
        
        
    }
   /* func
    Day.getActivityFetchedResultController("Activity", key: "idAct", predicat: "dayIs=%@", args: receved!)
    Day.getDayFetchedResultController("Day", key: "keyDay")*/
}

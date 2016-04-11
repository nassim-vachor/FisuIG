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
    
    // test de la fonction qui insere des nouveau day
    func testDayInsert()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        ///- l'insertion d'un nouveau day
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        XCTAssertNotNil(day8, "L'insertion de Day8 c'est bien passee")
         let day9 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        
        ///- Si jamais on insere un day qui a deja ete insere, il n y pas d erreur ni de nouvelle insertion: le day qui avait ete insere est juste retourne
        XCTAssertEqual(day8, day9, "Le day8 et le day9 correspondent au meme Day")
         
    }
    
    
    /// test de la fonction qui renvoie toutes les activités d'un jour donné
    func testGetActivityFetchedResultController()
    {
        
        
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        let day8 = Day.insertNewDay(moc, id: 8, day: "Day 8")
        let act = Activity.insertNewActivity(moc, id: 100, nom: "test", desc: "testing", dateD: "04/08/2016, 12:00", dateF: "04/08/2016, 13:00", lieu: nil, speak:  nil , photo: "McDonald's" , day: day8, selected: false )
        XCTAssertEqual(act?.dayIs?.day, "Day 8",  "L'insertion de act c'est bien passee")
        ///- recuperation des activites correspondant a Day8
        let frc = Day.getActivityFetchedResultController("Activity", key: "idAct", predicat: "dayIs=%@", args: (day8)!)
        
        do {
            try frc.performFetch()
        } catch {
            
            print("An error occured")
        }
        let sections = frc.sections
        let currentSection = sections![0]
        
        XCTAssertEqual( currentSection.numberOfObjects, 1,   "il n ya pas d activite pour Day8")
  
    }
    
    // test de la fonction qui renvoie tous les jours existants dans la base
    func testGetDayFetchedResultController()
    {
       let   frc = Day.getDayFetchedResultController("Day", key: "keyDay")
        do {
        try frc.performFetch()
               } catch {
    
               print("An error occured")
           }
           let sections = frc.sections
           let currentSection = sections![0]
            // On avait 6 day à la base , comme on insere un autre dans la fonction precedente on se retrouve avec 7 day
           XCTAssertEqual( currentSection.numberOfObjects, 7,   "le nombre de jour existant est faux")
        
    }

}

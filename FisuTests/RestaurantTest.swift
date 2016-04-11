//
//  RestaurantTest.swift
//  Fisu
//
//  Created by Djeneba KANE on 11/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import XCTest
@testable import Fisu

class RestaurantTest: XCTestCase {
    
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
    
    
    func testInsertRestaurant()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext

     let res1 =  Restaurant.insertNewRestaurant(moc, id: 1000, nom: "Domino's Pizza", spec:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: nil , tel: "06 67 79 29 20", photo: "Domino's")
        
          XCTAssertNotNil(res1, "L'insertion de res1 c'est mal bien passee")
        
        let res2 =  Restaurant.insertNewRestaurant(moc, id: 1000, nom: "Domino's Pizza", spec:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: nil , tel: "06 67 79 29 20", photo: "Domino's")
        
        
        // verification de l'egalite entre res1 et res2
        ///- Si jamais on insere un restaurant  qui a deja ete insere, il n'y pas d erreur ni de nouvelle insertion: le restaurant qui avait ete insere est juste retourne
        XCTAssertEqual(res1, res2, "res1 et res2 ne correspondent pas au meme restaurant")
        
        // nettoyage de la base apres les test
     //   Restaurant.deleteData(1000)
      
        
    }
    
    
    func testgetDay()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let res1 =  Restaurant.insertNewRestaurant(moc, id: 1000, nom: "Domino's Pizza", spec:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: nil , tel: "06 67 79 29 20", photo: "Domino's")
        
        ///- permet de recuperer le day correspondant a res1
        
        XCTAssertEqual(res1!.getDay(),"Monday, July 4, 2016")
        
        // nettoyage de la base apres les test
     //   Restaurant.deleteData(1000)

        
    }
    
    // test de la fonction convertStringToNSDate : permettant de trasformer un string en NSDate
    func testconvertStringToNSDate()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        // initialisation d une Restaurant ayant lieu le 8eme jour
         let res1 =  Restaurant.insertNewRestaurant(moc, id: 1000, nom: "Domino's Pizza", spec:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: nil , tel: "06 67 79 29 20", photo: "Domino's")
        
        // res1!.dateFin est un NSDate
        XCTAssertEqual(res1!.hourdeb ,Restaurant.convertStringToNSDate("04/07/2016, 11:00"), " ces deux NSDate ne sont pas egales")
        
        // nettoyage de la base apres les test
   //     Restaurant.deleteData(1003)
       
        
        
    }
    // fonction permettant de tester la foction  getTimeDeb et getTimeFin, qui retourne la date de debut d'une activite sous forme de String
    func testgetTimeDebFin()
    {
        
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        // initialisation d une Restaurant ayant lieu le 8eme jour
        let res1 =  Restaurant.insertNewRestaurant(moc, id: 1000, nom: "Domino's Pizza", spec:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: nil , tel: "06 67 79 29 20", photo: "Domino's")
        
        // verification de l egalite entre "12:00 PM" (correspondant a dateD de res1) et la date de debut de res1
        XCTAssertEqual(res1!.getTimeDeb(),"12:00 PM")
        
        /// verification de l egalite entre "1:00 PM" (correspondant a dateF de res1) et la date de fin de res1
        XCTAssertEqual(res1!.getTimeFin(),"1:00 PM")
        
        // nettoyage de la base apres les test
     //   Restaurant.deleteData(1003)
      
        
    }
    
    
    
}

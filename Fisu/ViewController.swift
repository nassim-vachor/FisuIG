//
//  ViewController.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    //- pr récuperer le contexte de la classe Appdelegate
 
    let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        self
        //
  // ************************************* LIEUX DES ACTIVITÉS *******************************
        let day1 = Day.insertNewDay(moc, id: 1, day: "Day 1")
        let day2 = Day.insertNewDay(moc, id: 2, day: "Day 2")
        let day3 = Day.insertNewDay(moc, id: 3, day: "Day 3")
        let day4 = Day.insertNewDay(moc, id: 4, day: "Day 4")
        let day5 = Day.insertNewDay(moc, id: 5, day: "Day 5")
        let day6 = Day.insertNewDay(moc, id: 6, day: "Day 6")
 // ************************************* LIEUX DES ACTIVITÉS *******************************
    // LIEUX DES ACTIVITÉS
    let Loc1 = Location.insertNewLocation(moc, id: 1, address: "Law Faculty" , lat: 43.61, long: 3.87)
    let Loc2 = Location.insertNewLocation(moc, id: 2, address: "Saint Charles" , lat: 43.61, long: 3.87)
    let Loc3 = Location.insertNewLocation(moc, id: 3, address: "Triolet" , lat: 43.61, long: 3.87)
    let Loc4 = Location.insertNewLocation(moc, id: 4, address: "Rectorat" , lat: 43.61, long: 3.87)
    let Loc5 = Location.insertNewLocation(moc, id: 5, address: "Town Hall" , lat: 43.61, long: 3.87)
    let Loc6 = Location.insertNewLocation(moc, id: 6, address: "Palis Universitaire Veyrassi" , lat: 43.6398876, long: 3.8456186)
    let Loc7 = Location.insertNewLocation(moc, id: 7, address: "La Grande Motte" , lat: 43.5607040, long: 4.0860720)
        
        
        
        
    let Loc11 = Location.insertNewLocation(moc, id: 27 , address: " chemin Sauzèdes BP 1, 34190 Saint-Bauzille-de-Putois" , lat: 43.8957750, long: 3.7375290)
     let Loc12 = Location.insertNewLocation(moc, id: 28 , address: "542 Rue Auguste Broussonnet, 34090 Montpellier" , lat: 43.6174383, long: 3.8678763)
        
    // speaker des actvité du Day
    let Speak1 = Speaker.insertNewSpeaker(moc, id: 1, nom: "Fiorio", prenom: "Christophe", biograp: "A teacher in computer science at Polytech MOntpellier", tel: "0675026923", photo:"Fiorio")
   
        
    let Speak2 = Speaker.insertNewSpeaker(moc, id: 2, nom: "Revel", prenom: "Laurent", biograp: "A teacher in Business intelligence at Polytech MOntpellier", tel: "0675021123", photo: "revel")
        
        
    let Speak3 = Speaker.insertNewSpeaker(moc, id: 3, nom: "Stratulat", prenom: "Tiberiu", biograp: "A teacher in software engineering", tel: "0675021144", photo: "tibi")
        
    let Speak4 = Speaker.insertNewSpeaker(moc, id: 4, nom: "Sala", prenom: "Michel", biograp: "A teacher in conception and information system at Polytech MOntpellier", tel: "0675021143", photo: "Sala")
        
   
        
        
        
        // LIEUX DES Restaurants
        
        let LocRes1 = Location.insertNewLocation(moc, id: 16 , address: "19 Quai des Tanneurs, 34000 Montpellier" , lat: 43.6157714, long: 3.8770789)
        
        let LocRes2 = Location.insertNewLocation(moc, id: 17 , address: "20 Rue de la Méditerranée, 34000 Montpellier" , lat: 43.6053301, long: 3.8835284)
        
        let LocRes3 = Location.insertNewLocation(moc, id: 18 , address: "5 Place Jean Jaurès, 34000 Montpellier" , lat: 43.6097992, long: 3.8782359)
        
        let LocRes4 = Location.insertNewLocation(moc, id: 19 , address: "7 Place de la Comédie, 34967 Montpellier" , lat: 43.6086772, long: 3.8793435)
        
        let LocRes5 = Location.insertNewLocation(moc, id: 20 , address: "6 Rue Boussairolles, 34000 Montpellier" , lat: 43.6083063, long: 3.8807284)
        
        let LocRes6 = Location.insertNewLocation(moc, id: 21 , address: " 3 Rue de Verdun, 34000 Montpellier" , lat: 43.6079210, long: 3.8802011)
        
        let LocRes7 = Location.insertNewLocation(moc, id: 22 , address: " 20 Rue Jacques Cœur, 34000 Montpellier" , lat: 43.6100917, long: 3.8794508)
        
        let LocRes8 = Location.insertNewLocation(moc, id: 23 , address: "6 Rue Jules Latreilhe, 34000 Montpellier" , lat: 43.6080059, long: 3.8762998)
        
        let LocRes9 = Location.insertNewLocation(moc, id: 24 , address: "45-47 Rue de l'Aiguillerie, 34000 Montpellier" , lat: 43.6121216, long: 3.8789372)
        
        let LocRes10 = Location.insertNewLocation(moc, id: 25 , address: "2 Rue Emile Duployé, 34000 Montpellier" , lat: 43.6237209, long: 3.8691886)
        
        let LocRes11 = Location.insertNewLocation(moc, id: 26 , address: "11 Rue de la Loge, 34000 Montpellier" , lat: 43.6096455, long: 3.8780622)
        
        
        ///jjjj
        
        // LIEUX DES Accomodations
        let LocAcco1 = Location.insertNewLocation(moc, id: 8, address: "125 bis Avenue de Palavas, 34000 Montpellier" , lat: 43.5896828, long: 3.8925621)
        
        let LocAcco2 = Location.insertNewLocation(moc, id: 9, address: "95, PLACE VAUBAN BOULEVARD D'ANTIGONE 34000 - MONTPELLIER" , lat: 43.6092224, long: 3.8878104)
        
        let LocAcco3 = Location.insertNewLocation(moc, id: 10, address: " Tournezy, 135 Rue Jugurtha, 34070 Montpellier" , lat: 43.5698050, long: 3.9041710	)
        
        let LocAcco4 = Location.insertNewLocation(moc, id: 11, address: "22 Boulevard Victor Hugo, 34000 Montpellier" , lat: 43.6075496, long: 3.8790840)
        
        let LocAcco5 = Location.insertNewLocation(moc, id: 12, address: "8 Rue de Maguelone, 34000 Montpellier" , lat: 43.6065812, long: 3.8796857)
        
        let LocAcco6 = Location.insertNewLocation(moc, id: 13, address: "4, rue du Cheval Blanc, Montpellier, France" , lat: 43.6073588, long: 3.8770755)
        
        let LocAcco7 = Location.insertNewLocation(moc, id: 14, address: "Rue des Écoles Laïques 34000 Montpellier - France" , lat: 43.6138184, long: 3.8790588)
        
        let LocAcco8 = Location.insertNewLocation(moc, id: 15 , address: "4 rue de la republique, montpellier, france" , lat: 43.6058772, long: 3.8776912)
        
        let LocAcco9 = Location.insertNewLocation(moc, id: 16 , address: "7 Boulevard Frédéric Fabrèges, 34250 Palavas-les-Flot" , lat: 43.5278046, long: 3.9264076)
        
        let LocAcco10 = Location.insertNewLocation(moc, id: 15 , address: "Rue Robert Schuman, 34430 Saint-Jean-de-Védas" , lat: 43.5675590, long: 3.8375420)
        
//******************************************Day1**********************************************************
        // création des activité du Day1 gràce à la methode de classe insertNewActivity
     
        
        
        let Activity1 = Activity.insertNewActivity(moc, id: 1, nom: "Open Ceremony", desc: "Open Ceremony for the FISU", dateD: "04/07/2016, 09:00", dateF: "04/07/2016, 12:30", lieu: Loc1, speak: Speak1, photo: "ceremony", day: day1)
        
       
        
        let Activity2 = Activity.insertNewActivity(moc, id: 2, nom: "UNESCO session", desc: "UNESCO will speak about the importance of FISU", dateD: "04/07/2016, 13:45", dateF: "04/07/2016, 14:30", lieu: Loc3, speak: Speak2, photo: "unesco", day: day1)
    
        
        let Activity3 = Activity.insertNewActivity(moc, id: 3, nom: "Football", desc: "Sport", dateD: "04/07/2016, 14:00", dateF: "04/07/2016, 17:00", lieu: Loc12, speak: Speak2, photo: "foot", day: day1)
        
        
        let Activity4 = Activity.insertNewActivity(moc, id: 4, nom: "Salsa session", desc: "Dance", dateD: "04/07/2016, 14:00", dateF: "04/07/2016, 17:00", lieu: Loc12, speak: Speak2, photo: "salsa", day: day1)
        
        
        let Activity5 = Activity.insertNewActivity(moc, id: 5, nom: "Projet working group", desc: "woking team in professionnal world", dateD :"04/07/2016, 15:30", dateF:"04/07/2016, 16:30", lieu: Loc1, speak: Speak4, photo: "team", day: day1)
   
        
        let Activity6 = Activity.insertNewActivity(moc, id: 6, nom: "Boules/Pétanque", desc: "playing and take a rest", dateD :"04/07/2016, 17:00", dateF:"04/07/2016, 19:00", lieu: Loc3, speak: nil, photo: "boule", day: day1)
      
        //hjhtgtg
   
        //**********************************************Day1finish****************************************************
        //********************************************Day2***********************************************************
        // création des activité du Day2 gràce à la methode de classe insertNewActivity
      
        let Activity7 = Activity.insertNewActivity(moc, id: 7, nom: "Plenary session", desc: "Values/Ethics/Integrity", dateD: "05/07/2016, 09:00", dateF: "05/07/2016, 10:00", lieu: Loc1, speak: Speak1, photo: "plenary", day: day2)
        
     
        let Activity8 = Activity.insertNewActivity(moc, id: 8, nom: "Projet Working", desc: "explain by scientist", dateD: "05/07/2016, 11:30", dateF: "05/07/2016, 12:30", lieu: Loc2, speak: Speak3, photo: "team" , day: day2)
  

      
        let Activity9 = Activity.insertNewActivity(moc, id: 9, nom: "Visit of Montpellier", desc: "Montpellier City", dateD :"05/07/2016, 16:30", dateF:"05/07/2016, 18:30", lieu: nil, speak: nil, photo: "montpell", day: day2)
        
      
    
        //********************************************Day2finish******************************************************
        //*********************************************Day3***********************************************************
        // création des activité du Day3 gràce à la methode de classe insertNewActivity
           let Activity10 = Activity.insertNewActivity(moc, id: 10, nom: "Plenary session", desc: "LeaderShip", dateD: "06/07/2016, 09:00", dateF: "06/07/2016, 10:00", lieu: Loc1, speak: Speak1, photo: "plenary", day: day3)
        

        let Activity11 = Activity.insertNewActivity(moc, id: 11, nom: "Projet Working Session", desc: "explain by scientist", dateD: "06/07/2016, 11:30", dateF: "06/07/2016, 12:30", lieu: Loc2, speak: Speak3, photo: "project", day: day3)
        

        let Activity12 = Activity.insertNewActivity(moc, id: 12, nom: "Rumba", desc: "Come on and enjoying dancing", dateD :"06/07/2016, 16:30", dateF:"06/07/2016, 17:30", lieu: Loc6, speak: nil, photo: "rumba", day: day3)
   

        //********************************************Day3finish******************************************************
        //*********************************************Day4***********************************************************
       
  
        
        let Activity13 = Activity.insertNewActivity(moc, id:13, nom: "HandBall", desc:"Sport", dateD: "07/07/2016, 08:00", dateF: "07/07/2016, 10:30", lieu: Loc12, speak: nil, photo: "hand", day: day4)
        
        let Activity14 = Activity.insertNewActivity(moc, id: 14, nom: "Volley", desc: "Sport", dateD: "07/07/2016, 10:30", dateF: "07/07/2016, 13:00", lieu: Loc12, speak:nil, photo: "volley", day: day4)
       
       
        let Activity15 = Activity.insertNewActivity(moc, id: 15, nom:  "Theather", desc: "Comedie", dateD :"07/07/2016, 13:45", dateF:"07/07/2016, 14:45", lieu: Loc2, speak: nil, photo: "theatre", day: day4)
        
         let Activity16 = Activity.insertNewActivity(moc, id: 16, nom: "Shopping", desc: "Doing shopping in your free time",dateD :"07/07/2016, 19:00", dateF:"07/07/2016, 19:45", lieu: Loc7, speak: nil, photo: "shopping", day: day4)
    
      
        let Activity17 = Activity.insertNewActivity(moc, id: 17, nom: "Party", desc: "Enjoy the party and relax you",dateD :"07/07/2016, 23:00", dateF:"07/07/2016, 03:45", lieu: Loc7, speak: nil, photo: "party", day: day4)
   

        //***********************************************Day4finish***************************************************
        //************************************************Day5******************************************************
       
        let Activity18 = Activity.insertNewActivity(moc, id: 18, nom: "Equitation", desc: "Riding horses", dateD: "08/07/2016, 09:00", dateF: "08/07/2016, 11:00", lieu: Loc1, speak: nil , photo: "equit", day: day5)
       

        let Activity19 = Activity.insertNewActivity(moc, id: 19, nom: "Visit of Montpellier", desc: "Montpellier city", dateD: "08/07/2016, 18:30", dateF: "08/07/2016, 19:45", lieu:nil, speak:nil, photo: "montpell", day: day5)
        
        let Activity20 = Activity.insertNewActivity(moc, id: 20, nom: "Running", desc: "Run", dateD: "08/07/2016, 19:45", dateF: "08/07/2016, 21:00", lieu: nil, speak: nil, photo: "run", day: day5)
       

        ///***********************************************Day5finish***************************************************
        //************************************************Day6******************************************************
      
       
        let Activity21 = Activity.insertNewActivity(moc, id: 21, nom: "Hiking", desc: "Morning hiking", dateD: "09/07/2016, 11:00", dateF: "09/07/2016, 11:30", lieu: Loc1, speak: nil, photo: "hiking", day: day6)
        
      
       
        let Activity22 = Activity.insertNewActivity(moc, id: 22, nom: "Canoe Kayyak", desc:"Sport", dateD :"09/07/2016, 17:00", dateF:"09/07/2016, 18:00", lieu: Loc11, speak: nil, photo: "canoe", day: day6)
        
        let Activity23 = Activity.insertNewActivity(moc, id: 23, nom: "Tennis", desc:"Sport", dateD :"09/07/2016, 17:00", dateF:"09/07/2016, 18:00", lieu: Loc12, speak: nil, photo: "tennis", day: day6)
       
        
          let Activity24 = Activity.insertNewActivity(moc, id: 24, nom: "Closing Ceremony", desc: "eating and relax", dateD :"09/07/2016, 09:30", dateF:"09/07/2016, 11:30", lieu: Loc5, speak: Speak4, photo: "ceremony", day: day6)
        
          let Activity25 = Activity.insertNewActivity(moc, id: 25, nom: "Beach", desc: "swimming and relax", dateD :"09/07/2016, 14:30", dateF:"09/07/2016, 17:30", lieu: Loc7, speak: nil, photo: "beach", day: day6)
        
         let Activity26 = Activity.insertNewActivity(moc, id: 26, nom: "Party", desc: "Come on and enjoy the party", dateD :"09/07/2016, 19:30", dateF:"09/07/2016, 23:30", lieu: Loc5, speak: nil, photo: "party", day: day6)
        
        
        
        
        
        //***********************************************Accomodation***************************************************
        
        let Acco1 = Accomodation.insertNewAccomodation(moc, id: 1, nom: "Novotel", desc: "Contemporary hotel with a terrace coffee ,a bar , an outdoor pool and a playground ", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco1, tel: "04 99 52 34 34", photo: "novotel" )
        
        let Acco2 = Accomodation.insertNewAccomodation(moc, id: 2, nom: "Ibis", desc: "Ibis is located close to Comedie place,Come and relax you in this beautiful hotel.", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco2, tel: "04 67 64 06 64", photo: "ibis")
        
        let Acco3 = Accomodation.insertNewAccomodation(moc, id: 3, nom: "Kyriad", desc: "Kyriad is a discreet property with standard rooms, 2 pools, spa, restaurant and free shuttle to the airport", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco3, tel: "04 67 64 56 45", photo: "kyriad")
        
        let Acco4 = Accomodation.insertNewAccomodation(moc, id: 4, nom: "Grand Hôtel du Midi", desc: "Hotel with elegant furniture. It offers cozy and equipped rooms with a Nespresso machine", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco4, tel: "04 67 92 69 61", photo: "GrandHotelMidi")
        
        let Acco5 = Accomodation.insertNewAccomodation(moc, id: 5, nom: "Royal Hôtel", desc: "Charming hotel offering cozy and classic rooms , simple decor and warm colors", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco5, tel: "04 67 92 13 36", photo: "RoyalHotel")
        
        let Acco6 = Accomodation.insertNewAccomodation(moc, id: 6, nom: " Hôtel Majestic", desc: "The Hotel Majestic is located in the heart of Montpellier city centre, 5mn walk from train station and 1 mn walk from famous Place de la Comedie", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco6, tel: "04 67 66 26 85", photo:"majestic" )
        
        let Acco7 = Accomodation.insertNewAccomodation(moc, id: 7, nom: "Auberge de jeunesse Montpellier", desc: "This hostel with a bar and pool offers dormitories and double rooms ; breakfast included", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco7, tel: "04 67 60 32 22", photo: "auberge" )
        
        let Acco8 = Accomodation.insertNewAccomodation(moc, id: 8, nom: " Hôtel de France", desc: "Hotel de France is a beautiful 18th century residence turned into a hotel in the 30's. It is close to the train and bus stations , Place de la Comédie and Corum.", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco8, tel: "04 67 92 29 29", photo: "HotelDeFrance")
        
        let Acco9 = Accomodation.insertNewAccomodation(moc, id: 9, nom: " Amerique Hotel", desc: "Establishment with lift offering colorful rooms with wifi, bar, pool and outdoor jacuzzi", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco9, tel: "04 67 68 04 39", photo: "AmeriqueHotel")
        
        let Acco10 = Accomodation.insertNewAccomodation(moc, id: 10, nom: "Hotel Prime", desc: "a hotel with outdoor pool offering simple but functional rooms", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: LocAcco10, tel: "04 67 07 59 59", photo: "PrimeHotel")
        
        
        
        
        //***********************************************Restauration***************************************************
        
        let Resto1 = Restaurant.insertNewRestaurant(moc, id: 1, nom: "Domino's Pizza", spec:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: LocRes1, tel: "06 67 79 29 20", photo: "Domino's")
        
        let Resto2 = Restaurant.insertNewRestaurant(moc, id: 2, nom: "Pizza Marsala", spec:"Pizza", dateD :"04/07/2016, 11:30", dateF:"01/07/2016, 23:00", adresse: LocRes2, tel: "09 52 54 54 22", photo:"PizzaMarsala" )

       let Resto3 = Restaurant.insertNewRestaurant(moc, id: 3, nom: "Subway", spec:"Fast Food specialized in sandwichs and salads", dateD :"01/07/2016, 09:00", dateF:"04/07/2016, 23:00", adresse: LocRes3, tel: "04 99 06 89 64", photo: "Subway")
        
        let Resto4 = Restaurant.insertNewRestaurant(moc, id: 4, nom: "Mcdonald's", spec:"Fast food specialized in sandwichs and ice creams", dateD :"01/07/2016, 10:00", dateF:"04/07/2016, 00:00", adresse: LocRes4, tel: "04 67 52 77 00", photo: "McDonald's")

        let Resto5 = Restaurant.insertNewRestaurant(moc, id: 5, nom: "La Rose des Sables", spec:"Kebab", dateD :"01/07/2016, 12:00", dateF:"04/07/2016, 01:00", adresse: LocRes5, tel: "04 99 63 93 15", photo: "RoseSable")
        
        let Resto6 = Restaurant.insertNewRestaurant(moc, id: 6, nom: "L'Entrecôte", spec:"Restaurant specialized in sirloin and fries", dateD :"01/07/2016, 13:00", dateF:"04/07/2016, 22:45", adresse: LocRes6, tel: "04 67 58 42 56", photo: "LEntrecote")
        
        let Resto7 = Restaurant.insertNewRestaurant(moc, id: 7, nom: "Tripti Kulai", spec:"vegetarian dishes and homemade desserts ", dateD :"04/07/2016, 13:00", dateF:"04/07/2016, 22:45", adresse: LocRes7 , tel: "04 67 66 30 51", photo: "TriptiKulai")
       let Resto8 = Restaurant.insertNewRestaurant(moc, id: 8, nom: "Le Bourgeon", spec:"Vegetarian and cooked meal", dateD :"01/07/2016, 16:15", dateF:"04/07/2016, 22:30", adresse: LocRes8 , tel: "04 67 60 51 86", photo: "Bourgeon")
        
        
        let Resto9 = Restaurant.insertNewRestaurant(moc, id: 9, nom: "French Connection", spec:"French, american cooking, vegetarian and coffee", dateD :"01/07/2016, 18:15", dateF:"04/07/2016, 22:30", adresse: LocRes9, tel: "06 76 60 76 38", photo: "FrenchConnection")

       let Resto10 = Restaurant.insertNewRestaurant(moc, id: 10, nom: "Restaurant Boutonnet", spec:"Kebbab", dateD :"01/07/2016, 11:30", dateF:"04/07/2016, 14:00", adresse: LocRes10 , tel: "04 67 63 52 06", photo: "RestoU")

        let Resto11 = Restaurant.insertNewRestaurant(moc, id: 11, nom: "Georges Café", spec:"Coffee", dateD :"04/07/2016, 15:00", dateF:"04/07/2016, 19:00", adresse: LocRes11 , tel: "04 67 66 01 63", photo: "GeorgesCafe")
        
       /* let Activity67 = Activity.insertNewActivity(moc, id: 67, nom: "Closing Ceremony", desc: "eating and relax", dateD :"09/07/2016, 19:30", dateF:"09/07/2016, 21:30", lieu: Loc5, speak: nil, photo : "AmeriqueHotel")
        let Activity68 = Activity.insertNewActivity(moc, id: 68, nom: "Closing Ceremony", desc: "eating and relax", dateD :"09/07/2016, 19:30", dateF:"09/07/2016, 21:30", lieu: Loc5, speak: nil, photo : "Domino's")*/
        
        // manip pour afficher l image dans le simulateur
       /* let a = UIImage (data: (Activity68?.photoActi)!)
        let imageView = UIImageView ( image: a!)
        imageView.frame = CGRect (x: 220, y: 150, width: 40, height: 50)
        view.addSubview(imageView)*/
       print(Acco9?.getTimeDeb())
    
       print(Resto9?.getTimeDeb())
    }
   override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(animated: Bool) {
        if (navigationController?.topViewController != self){
            navigationController?.navigationBarHidden = false
            
        
        }
        super.viewWillDisappear(animated)
        
        
    }
  
    @IBAction func start(sender: AnyObject) {
     
    }
    @IBOutlet weak var backg: UIImageView!

    @IBOutlet weak var logo: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//
//  ViewController.swift
//  PAOV2
//
//  Created by Duong Do Van on 4/9/19.
//  Copyright © 2019 Duong Do Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let btnPerson: UIButton = {
        let bt = UIButton()
        bt.setTitle("PERSON", for: .normal)
        bt.backgroundColor = .blue
        return bt
    }()
    
    let btnAction: UIButton = {
        let bt = UIButton()
        bt.setTitle("ACTION", for: .normal)
        bt.setTitleColor( .black, for: .normal)
        bt.backgroundColor = .green
        return bt
    }()
    
    let btnObject: UIButton = {
        let bt = UIButton()
        bt.setTitle("OBJECT", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = .purple
        return bt
    }()
    
    let btnPAO: UIButton = {
        let bt = UIButton()
        bt.setTitle("PAO", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = .orange
        return bt
    }()
    
    let btnCard: UIButton = {
        let bt = UIButton()
        bt.setTitle("CARD", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .mainPink
        return bt
    }()
    
    let btnBinary: UIButton = {
        let bt = UIButton()
        bt.setTitle("BINARY", for: .normal)
        bt.setTitleColor(.mainPink, for: .normal)
        bt.backgroundColor = .cyan
        return bt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
//    Action when device rotate
    override func viewWillLayoutSubviews() {
       
    }
    
    func setupViews(){
//        set background color with image
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Home Background"))
//        view.backgroundColor = UIColor(patternImage: "Home")
//        Ẩn Navigation Bar
//        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(btnPerson)
        btnPerson.translatesAutoresizingMaskIntoConstraints = false
        btnPerson.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/8).isActive = true
        btnPerson.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        btnPerson.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        btnPerson.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.frame.width/4).isActive = true
//        Co topAnchor roi khong can toi centerYAnchor nua
//        btnPerson.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/4).isActive = true
        btnPerson.addTarget(self, action: #selector(btnPersonPress), for: .touchUpInside)
        
        view.addSubview(btnAction)
        btnAction.translatesAutoresizingMaskIntoConstraints = false
        btnAction.leadingAnchor.constraint(equalTo: btnPerson.trailingAnchor, constant: view.frame.width/6).isActive = true
        btnAction.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        btnAction.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        btnAction.centerYAnchor.constraint(equalTo: btnPerson.centerYAnchor).isActive = true
        btnAction.addTarget(self, action: #selector(btnActionPress), for: .touchUpInside)
        
        
        view.addSubview(btnObject)
        btnObject.translatesAutoresizingMaskIntoConstraints = false
        btnObject.topAnchor.constraint(equalTo: btnPerson.bottomAnchor, constant: view.frame.height/10).isActive = true
        btnObject.centerXAnchor.constraint(equalTo: btnPerson.centerXAnchor).isActive = true
        btnObject.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        btnObject.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        btnObject.addTarget(self, action: #selector(btnObjectPress), for: .touchUpInside)
        
        view.addSubview(btnPAO)
        btnPAO.translatesAutoresizingMaskIntoConstraints = false
        btnPAO.leadingAnchor.constraint(equalTo: btnObject.trailingAnchor, constant: view.frame.width/6).isActive = true
        btnPAO.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        btnPAO.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        btnPAO.centerYAnchor.constraint(equalTo: btnObject.centerYAnchor).isActive = true
        btnPAO.addTarget(self, action: #selector(btnPAOPress), for: .touchUpInside)
        
        view.addSubview(btnCard)
        btnCard.translatesAutoresizingMaskIntoConstraints = false
        btnCard.topAnchor.constraint(equalTo: btnObject.bottomAnchor, constant: view.frame.height/10).isActive = true
        btnCard.centerXAnchor.constraint(equalTo: btnObject.centerXAnchor).isActive = true
        btnCard.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        btnCard.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        btnCard.addTarget(self, action: #selector(btnCardPress), for: .touchUpInside)
        
        view.addSubview(btnBinary)
        btnBinary.translatesAutoresizingMaskIntoConstraints = false
        btnBinary.leadingAnchor.constraint(equalTo: btnCard.trailingAnchor, constant: view.frame.width/6).isActive = true
        btnBinary.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        btnBinary.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
        btnBinary.centerYAnchor.constraint(equalTo: btnCard.centerYAnchor).isActive = true
        btnBinary.addTarget(self, action: #selector(btnBinaryPress), for: .touchUpInside)
        
    }

    @objc func btnPersonPress(_sender: UIButton){
        print("Person")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let personViewController = PersonViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(personViewController, animated: true)
    }
    
    @objc func btnActionPress(_sender: UIButton){
        print("Action")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let actionViewController = ActionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(actionViewController, animated: true)
    }
    
    @objc func btnObjectPress(_sender: UIButton){
        print("Object")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let objectViewController = ObjectViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(objectViewController, animated: true)
    }
    
    @objc func btnPAOPress(_sender: UIButton){
        print("PAO")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let paoViewController = PaoViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(paoViewController, animated: true)
    }
    
    @objc func btnCardPress(_sender: UIButton){
        print("Card")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cardViewController = CardViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(cardViewController, animated: true)
    }
    
    @objc func btnBinaryPress(_sender: UIButton){
        print("Binary")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let binaryViewController = BinaryController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(binaryViewController, animated: true)
    }
}

//
//  ViewController.swift
//  Test Collection View
//
//  Created by Mohsen Abdollahi on 5/31/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Set Clusore ImageView
    let bearImageView: UIImageView  = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "cat") )
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //set Clusore for TextView
    let descriptionTextView : UITextView = {
        
       let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
      
        attributedText.append(NSAttributedString(string: "\n\nAre you ready to join us and  get some happy with codding by Xcode and build some awsome fantastic app and enjoy ! come on we are waiting for you !", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
          textView.attributedText = attributedText
        
//        textView.text = "join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    
    // Mske sure about encapsulation
   private let perviousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT ", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let pinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        return button
    }()
    
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = .gray
        return pc
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        setupButtonControl()
        setupLayout()
        
    }
    
    

    private func setupButtonControl() {
         //view.addSubview(perviousButton)
//        perviousButton.backgroundColor = .red

        
//
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        
//        let greenView = UIView()
//        greenView.backgroundColor = .green
        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [perviousButton,pageControl,nextButton])
        view.addSubview(bottomControlStackView)
  
        bottomControlStackView.distribution = .fillEqually
        //bottomControlStackView.axis = .vertical
        
        
//        perviousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        //perviousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        bottomControlStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupLayout(){
        
        let topImageContainerView = UIView()
        //topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        
        //Enable AutoLayout and Customize UI container
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        Apple recomendation use leading and trailing
//        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        //Insert image to Container
        topImageContainerView.addSubview(bearImageView)
        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor, constant: 0).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 0).isActive = true
        //bearImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        //Customize image and position in UI
//        bearImageView.translatesAutoresizingMaskIntoConstraints = false
//        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
            
        //Customize TextView
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        //descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor , constant: 100).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor , constant: 0).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 27).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -27).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}


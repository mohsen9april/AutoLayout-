//
//  PageCell.swift
//  Test Collection View
//
//  Created by Mohsen Abdollahi on 6/1/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    var pageinPageCell : Page? {
        didSet{
            //print(pageinPageCell?.imageName)
            bearImageView.image = UIImage(named: (pageinPageCell?.imageName)!)
            
            
            
            // for text
            
        
//                let attributedText = NSMutableAttributedString(string: "join us today in our fun and games!", attributes:             [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            let attributedText = NSMutableAttributedString(string: (pageinPageCell?.headerText)!, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            
            attributedText.append(NSAttributedString(string: (pageinPageCell?.bodyText)!, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
   
        }
    }

    
    
    
    
    
    //Set Clusore For ImageView
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
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout(){
        
        let topImageContainerView = UIView()
        //topImageContainerView.backgroundColor = .blue
        addSubview(topImageContainerView)
        
        //Enable AutoLayout and Customize UI container
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        //Insert image to Container
        topImageContainerView.addSubview(bearImageView)
        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor, constant: 0).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 0).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        
        //Customize TextView
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        //descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor , constant: 100).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor , constant: 0).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 27).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -27).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

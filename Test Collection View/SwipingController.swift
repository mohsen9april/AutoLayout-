//
//  SwipingController.swift
//  Test Collection View
//
//  Created by Mohsen Abdollahi on 6/1/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [Page(imageName: "cat", headerText: "join us today in our fun and games!", bodyText:"\nbodyText1"),
                 Page(imageName: "wall-e1", headerText: "showing WallE 1 !", bodyText: "\nbodyText2"),
                 Page(imageName: "wall-e2", headerText: "showing WallE 2 !",bodyText: "\nbodytext3"),
                 Page(imageName: "wall-e3", headerText: "showing WallE 3 !", bodyText: "\nbodyText4")
                ]
    
    
//    let imageName = ["cat","wall-e1","wall-e2","wall-e3"]
//    let headerString = ["join us today in our fun and games!","showing WallE 1 which he is waiting !","show Wall e 2 which he is going to shop!","show wall E 3 which he is back from shopong without buy anything!"]
    
    
    
    // Mske sure about encapsulation
    private let perviousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
         button.addTarget(self , action: #selector(handlePrev), for: .touchUpInside )
        return button
    }()
    
    @objc private func handlePrev(){
        print("trying to go Prev page !")
        let PrevIndex = pageControl.currentPage - 1
        print(PrevIndex)
        if PrevIndex >= 0 {
            pageControl.currentPage = PrevIndex }
        else {
            return
        }
        print(PrevIndex)
        let indexPath = IndexPath(item: PrevIndex , section: 0)
        print(indexPath)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT ", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let pinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        button.addTarget(self , action: #selector(handleNext), for: .touchUpInside )
        return button
    }()
    
    @objc private func handleNext(){
        
        print("trying to go next page !")
        let nextIndex = pageControl.currentPage + 1
        if nextIndex <= 3 {
            pageControl.currentPage = nextIndex }
        else {
            return
        }
        print(nextIndex)
        let indexPath = IndexPath(item: nextIndex , section: 0)
        print(indexPath)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = .gray
        return pc
        
    }()
    
    
    private func setupButtonControl() {

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
    
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        print(x, view.frame.width, x / view.frame.width)
        pageControl.currentPage = Int((x / view.frame.width))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView?.backgroundColor  = .green
        collectionView?.backgroundColor  = .white
        collectionView.isPagingEnabled = true
        
        setupButtonControl()
        
        
        //Cell Identifeir
            //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! PageCell
        
        let pageinSwipingController = pages[indexPath.item]
        cell.pageinPageCell = pageinSwipingController
        
//        cell.bearImageView.image = UIImage(named: pages[indexPath.item].imageName)
//        cell.descriptionTextView.text = pages[indexPath.item].headerText
        //cell.backgroundColor = .red
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

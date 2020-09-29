//
//  TripleContainerView.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//
import UIKit

class TripleContainerView: UIView {
    let firstView: UIView
    let secondView: UIView
    let thirdView: UIView
    
    let padding: CGFloat
    let isAppearVerticalLineOnRight: Bool
    
    init(first: UIView, second: UIView, third: UIView, padding: CGFloat, isAppearVerticalLineOnRight: Bool) {
        self.firstView  = first
        self.secondView = second
        self.thirdView  = third
        self.padding    = padding
        self.isAppearVerticalLineOnRight = isAppearVerticalLineOnRight
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        guard subviews.count == 0 else {
            return
        }
        
        setupViews()
    }
    
    private func setupViews() {
        let heightScales: [CGFloat] = [0.2, 0.4, 0.4]
        let height = frame.height
        let padding: CGFloat = 10
        addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: self.topAnchor),
            firstView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
            firstView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            firstView.heightAnchor.constraint(equalToConstant: height * heightScales[0])
        ])
        
        addSubview(thirdView)
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            thirdView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
            thirdView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            thirdView.heightAnchor.constraint(equalToConstant: height * heightScales[2])
        ])
        
        addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 5),
            secondView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
            secondView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
            secondView.heightAnchor.constraint(equalToConstant: height * heightScales[1])
        ])
        
        if isAppearVerticalLineOnRight {
            let separatorLine = UIView()
            // TODO: make this color customizable
            separatorLine.backgroundColor = UIColor(red: 43 / 255.0, green: 49 / 255.0, blue: 63 / 255.0, alpha: 1.0)
            addSubview(separatorLine)
            separatorLine.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                separatorLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor),
                separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
                separatorLine.widthAnchor.constraint(equalToConstant: 2)
            ])
        }
    }
}

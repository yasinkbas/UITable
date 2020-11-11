//
//  ViewController.swift
//  UITable
//
//  Created by yasinkbas on 09/22/2020.
//  Copyright (c) 2020 yasinkbas. All rights reserved.
//

import UIKit
import UITable

class ViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1)
        ])
    }
    
    private func setupTable() {
        let theme = MyExampleTheme()
        let table = UITable(
            request: .init(
                theme: theme,
                columns: pokemonDataSource(),
                columnWidths: [0.2, 0.4, 0.4],
                highlightedColumnIndex: -1,
                superNavHeight: nil,
                titleRowWillAppear: true
            )
        )
        scrollView.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 8),
            table.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -8),
            table.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 8),
            table.heightAnchor.constraint(equalToConstant: CGFloat(100 * table.rowCount!)),
            contentView.bottomAnchor.constraint(equalTo: table.bottomAnchor, constant: 20)
        ])
    }
    
    private func pokemonDataSource() -> UITableColumns {
        return [
            .init(values: [
                .label("1"),
                .label("2"),
                .label("3"),
                .label("4"),
                .label("5"),
                .label("6"),
                .label("7"),
                .label("8"),
                .label("9"),
                .label("10"),
                .label("11"),
                .label("12")
                ]
            ),
            .init(title: "Pokemon", values: [
                .imageView(#imageLiteral(resourceName: "mewtwo")),
                .imageView(#imageLiteral(resourceName: "pikachu")),
                .imageView(#imageLiteral(resourceName: "suicune")),
                .imageView(#imageLiteral(resourceName: "charizard")),
                .imageView(#imageLiteral(resourceName: "rayquaza")),
                .imageView(#imageLiteral(resourceName: "gengar")),
                .imageView(#imageLiteral(resourceName: "blaziken")),
                .imageView(#imageLiteral(resourceName: "mimikyu")),
                .imageView(#imageLiteral(resourceName: "greninja")),
                .imageView(#imageLiteral(resourceName: "garchomp")),
                .imageView(#imageLiteral(resourceName: "decidueye")),
                .imageView(#imageLiteral(resourceName: "zygarde"))
            ]),
            .init(title: "Name", values: [
                .label("Mewtwo"),
                .label("Pikachu"),
                .label("Suicune"),
                .label("Charizard"),
                .label("Rayquaza"),
                .label("Gengar"),
                .label("Blaziken"),
                .label("Mimikyu"),
                .label("Greninja"),
                .label("Garchomp"),
                .label("Decidueye"),
                .label("Zygarde")
            ])
        ]
    }
}

extension ViewController {
    final class MyExampleTheme: UITableTheme {
        override var backgroundColor: UIColor { #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) }
        override var cornerRadius: CGFloat { 10 }
        override var borderColor: CGColor { #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) }
        override var borderWidth: CGFloat { 1 }
        override var highlightedColor: UIColor { #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) }
        override var highlightedBorderColor: UIColor { #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
    }
}

extension ViewController {
    struct MyExampleTheme: UITableThemeProvider {
        var backgroundColor: UIColor { #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) }
        var cornerRadius: CGFloat { 10 }
        var borderColor: CGColor { #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) }
        var borderWidth: CGFloat { 1 }
        var highlightedColor: UIColor { #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) }
        var highlightedBorderColor: UIColor { #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
    }
}


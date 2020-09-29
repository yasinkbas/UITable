//
//  UITable.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/23/20.
//

import UIKit

class UITable: UIView {
    
    private let theme: UITableThemeProvider
    
    private var columns: Columns
    private var columnWidths: [CGFloat]
    private var superNavHeight: CGFloat?
    private var highlightedColumnIndex: Int
    
    private let highlightedColor: UIColor
    private let highlightedBorderColor: UIColor
    
    private let titleRowWillAppear: Bool
    
    private var rowCount: CGFloat? {
        columns.map { CGFloat($0.values.count + (titleRowWillAppear ? 1 : 0)) }.min()
    }
    
    private var columnCount: CGFloat {
        CGFloat(columns.count)
    }
    
    private var highlightFrameStartAt: CGPoint?
    private var highlightFrameEndAt: CGPoint?
    
    init(request: UITableRequest) {
        self.theme                  = request.theme
        self.columns                = request.columns
        self.columnWidths           = request.columnWidths
        self.superNavHeight         = request.superNavHeight
        self.highlightedColumnIndex = request.highlightedColumnIndex
        self.highlightedColor       = request.theme.highlightedColor
        self.highlightedBorderColor = request.theme.highlightedBorderColor
        self.titleRowWillAppear     = request.titleRowWillAppear
        super.init(frame: .zero)
        customizeAppearance(theme: theme)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeAppearance(theme: UITableThemeProvider) {
        backgroundColor         = theme.backgroundColor
        layer.cornerRadius      = theme.cornerRadius
        layer.borderColor       = theme.borderColor
        layer.borderWidth       = theme.borderWidth
        layer.masksToBounds     = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    private func setupViews() {
        guard let rowCount = rowCount else {
            fatalError("There is no column")
        }
        guard subviews.count == 0 else {
            return
        }
        
        setupTable(rowCount: rowCount)
        
        if let startAt = highlightFrameStartAt,
            let endAt = highlightFrameEndAt {
            setupHighlightFrame(startAt: startAt, endAt: endAt)
        }
    }
    
    private func setupTable(rowCount: CGFloat) {
        var x: CGFloat = 0
        
        columns.enumerated().forEach { columnIndex, column in
            setupColumn(
                coordinateX: x,
                rowIndex: rowCount,
                columnIndex: columnIndex,
                column: column,
                setupRowsOfColumn: { cellWidth, cellHeight in
                    column.values.enumerated().forEach { rowIndex, cellContent in
                        setupRow(
                            coordinateX: x,
                            cellWidth: cellWidth,
                            cellHeight: cellHeight,
                            columnIndex: columnIndex,
                            rowIndex: rowIndex,
                            cellContent: cellContent
                        )
                    }
                    x += cellWidth
            })
        }
    }
    
    private func setupColumn(coordinateX x: CGFloat, rowIndex: CGFloat, columnIndex: Int, column: UITableColumn, setupRowsOfColumn: (_ cellWidth: CGFloat, _ cellHeight: CGFloat) -> ()) {
        let cellWidth = frame.size.width * columnWidths[columnIndex]
        let cellHeight = frame.size.height / rowIndex
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        let rowIndex = 0
        
            let tableCell = setupHeaderTableCell(
                x: x,
                title: column.title,
                columnIndex: columnIndex,
                rowIndex: rowIndex,
                cellSize: titleRowWillAppear ? cellSize : .init(width: 0, height: 0)
            )
            addSubview(tableCell)
        
        
        if columnIndex == highlightedColumnIndex {
            highlightFrameStartAt = tableCell.frame.origin
        }
        
        setupRowsOfColumn(cellWidth, cellHeight)
    }
    
    private func setupRow(coordinateX: CGFloat, cellWidth: CGFloat, cellHeight: CGFloat, columnIndex: Int, rowIndex: Int, cellContent: UITableCellContent) {
        let tableCell = setupContentTableCell(
            x: coordinateX,
            cellContent: cellContent,
            columnIndex: columnIndex,
            rowIndex: rowIndex,
            cellSize: CGSize(width: cellWidth, height: cellHeight)
        )
        
        addSubview(tableCell)
        
        if columnIndex == highlightedColumnIndex {
            highlightFrameEndAt = CGPoint(
                x: tableCell.frame.origin.x + tableCell.frame.size.width,
                y: tableCell.frame.origin.y + tableCell.frame.size.height
            )
        }
    }
    
    private func setupHeaderTableCell(x: CGFloat, title: String, columnIndex: Int, rowIndex: Int, cellSize: CGSize) -> TableCell<UILabel> {
        let frame = CGRect(x: x, y: 0, width: cellSize.width, height: cellSize.height)
        let backgroundColor = columnIndex == highlightedColumnIndex ? highlightedColor : .clear
        let request = UITableCellRequest(isTopSeperatorEnabled: false, backgroundColor: backgroundColor, separatorColor: UIColor(cgColor: theme.borderColor))
        let tableCell = TableCell<UILabel>(frame: frame, columnIndex: columnIndex, rowIndex: rowIndex, request: request) {
            let label = UILabel(style: UITableViewStyle.Label.tableHeaderLabelStyle)
            label.text = "\(title)"
            return label
        }
        
        return tableCell
    }
    
    private func setupContentTableCell(x: CGFloat, cellContent: UITableCellContent, columnIndex: Int, rowIndex: Int, cellSize: CGSize) -> TableCell<UIView> {
        let rowIndexPlus = titleRowWillAppear ? 1 : 0
        let frame = CGRect(
            x: x,
            y: CGFloat(rowIndex + rowIndexPlus) * cellSize.height,
            width: cellSize.width,
            height: cellSize.height
        )
        
        let backgroundColor = columnIndex == highlightedColumnIndex ? highlightedColor : .clear
        let request = UITableCellRequest(isTopSeperatorEnabled: true, backgroundColor: backgroundColor, separatorColor: UIColor(cgColor: theme.borderColor))
        
        let tableCell = TableCell(frame: frame, columnIndex: columnIndex, rowIndex: rowIndex, request: request) {
            var cellContentView: UIView
            switch cellContent {
            case let .label(text):
                let label = UILabel(style: columnIndex == 0 ?
                    UITableViewStyle.Label.tableDescriptionLabelStyle :
                    UITableViewStyle.Label.tableContentLabelStyle)
                label.text = text
                cellContentView = label
                
            case let .imageView(image):
                let imageView = UIImageView(style: UITableViewStyle.ImageView.tableContentImageViewStyle)
                imageView.image = image
                cellContentView = imageView
                
            case let .tripleLIL(text1, image, text2, isAppearVerticalLineOnRight):
                let label1 = UILabel(style: UITableViewStyle.Label.tableContentLabelStyle)
                label1.text = text1
                let imageView = UIImageView(style: UITableViewStyle.ImageView.tableContentImageViewStyle)
                imageView.image = image
                let label2 = UILabel(style: UITableViewStyle.Label.tableContentLabelStyle)
                label2.text = text2
                
                let containerView = TripleContainerView(
                    first: label1,
                    second: imageView,
                    third: label2,
                    padding: 0,
                    isAppearVerticalLineOnRight: isAppearVerticalLineOnRight
                )
                cellContentView = containerView
                
            }
            
            return cellContentView
        }
        
        return tableCell
    }
    
    private func setupHighlightFrame(startAt: CGPoint, endAt: CGPoint) {
        let highlightFrame = UIView(style: UITableViewStyle.View.highlightedFrameStyle(borderColor: highlightedBorderColor))
        highlightFrame.frame = CGRect(
            x: startAt.x,
            y: startAt.y,
            width: endAt.x - startAt.x,
            height: endAt.y - startAt.y
        )
        
        let point = highlightFrame.convert(self.frame.origin, to: superview)
        highlightFrame.frame.origin = CGPoint(x: point.x, y: point.y + (superNavHeight ?? 0))
        highlightFrame.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        
        let lineLength: CGFloat = 15
        let trianglePiece = UIView(frame: .init(origin: .zero, size: .init(width: lineLength, height: lineLength)))
        let trianglePieceLayer = CAShapeLayer()
        
        let trianglePath = UIBezierPath()
        trianglePath.move(to: .init(x: 0, y: 0))
        trianglePath.addLine(to: .init(x: lineLength, y: lineLength))
        trianglePath.addLine(to: .init(x: lineLength, y: 0))
        trianglePath.close()
        
        trianglePieceLayer.path = trianglePath.cgPath
        trianglePieceLayer.fillColor = highlightedBorderColor.cgColor
        
        trianglePiece.layer.insertSublayer(trianglePieceLayer, at: 0)
        
        // hide table border inside highlighted area
        let hideBorderFrame = highlightFrame.copyView()
        hideBorderFrame.apply(UITableViewStyle.View.highlightedFrameHiderStyle(highlightedColor: highlightedColor))
        hideBorderFrame.transform = .identity
        superview?.addSubview(hideBorderFrame)
        
        superview?.addSubview(highlightFrame)
        highlightFrame.addSubview(trianglePiece)
        trianglePiece.layer.zPosition = 1
        
        trianglePiece.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trianglePiece.rightAnchor.constraint(equalTo: highlightFrame.rightAnchor),
            trianglePiece.topAnchor.constraint(equalTo: highlightFrame.topAnchor),
            trianglePiece.widthAnchor.constraint(equalToConstant: lineLength),
            trianglePiece.heightAnchor.constraint(equalToConstant: lineLength)
        ])
    }
}


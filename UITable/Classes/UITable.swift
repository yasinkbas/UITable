//
//  Table.swift
//  UITable
//
//  Created by Yasin Akbaş on 9/21/20.
//

import UIKit

public class UITable: UIView {
    public typealias Columns = [UITableColumn]
    
    var columns: Columns
    let style: UITableStyleRequest
    
    var columnWidths: [CGFloat]
    var highlightedColumnIndex: Int
    var superNavHeight: CGFloat?
    
    let highlightedColor: UIColor = #colorLiteral(red: 0.04706721753, green: 0.08229299635, blue: 0.1292892992, alpha: 1)
    
    var rowCount: CGFloat? {
        columns.map { CGFloat($0.values.count + 1) }.min()
    }
    
    var columnCount: CGFloat {
        CGFloat(columns.count)
    }
    
    private var highlightFrameStartAt: CGPoint?
    private var highlightFrameEndAt: CGPoint?
    
    public init(
        columns: Columns,
        request: UITableStyleRequest,
        columnWidths: [CGFloat],
        highlightedColumnIndex: Int,
        superNavHeight: CGFloat?
    ) {
        self.columns = columns
        self.style = request
        self.columnWidths = columnWidths
        self.highlightedColumnIndex = highlightedColumnIndex
        self.superNavHeight = superNavHeight
        super.init(frame: .zero)
        customizeAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeAppearance() {
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius
        layer.borderColor = style.borderColor.cgColor
        layer.borderWidth = style.borderWidth
        layer.masksToBounds = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    func setupViews() {
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
            let cellWidth = frame.size.width * columnWidths[columnIndex]
            let cellHeight = frame.size.height / rowCount
            let cellSize = CGSize(width: cellWidth, height: cellHeight)
            let rowIndex = 0
            let tableCell = setupHeaderTableCell(
                x: x,
                title: column.title,
                columnIndex: columnIndex,
                rowIndex: rowIndex,
                cellSize: cellSize
            )
            addSubview(tableCell)
            
            if columnIndex == highlightedColumnIndex {
                highlightFrameStartAt = tableCell.frame.origin
            }
            
            column.values.enumerated().forEach { rowIndex, cellTitle in
                let tableCell = setupContentTableCell(
                    x: x,
                    title: cellTitle,
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
            
            x += cellWidth
        }
    }
    
    private func setupHeaderTableCell(x: CGFloat, title: String, columnIndex: Int, rowIndex: Int, cellSize: CGSize) -> UITableCell {
        let frame = CGRect(x: x, y: 0, width: cellSize.width, height: cellSize.height)
        let backgroundColor = columnIndex == highlightedColumnIndex ? highlightedColor : .clear
        let request = UITableCellStyleRequest(isTopseparatorEnabled: false, separatorColor: style.separatorColor, backgroundColor: backgroundColor)
        
        let tableCell = UITableCell(frame: frame, columnIndex: columnIndex, rowIndex: rowIndex, request: request) {
            let label = UILabel(style: TableViewStyle.Label.tableHeaderLabelStyle)
            label.text = "\(title)"
            return label
        }
        
        return tableCell
    }
    
    private func setupContentTableCell(x: CGFloat, title: String, columnIndex: Int, rowIndex: Int, cellSize: CGSize) -> UITableCell {
        let frame = CGRect(x: x, y: CGFloat(rowIndex + 1) * cellSize.height, width: cellSize.width, height: cellSize.height)
        let backgroundColor = columnIndex == highlightedColumnIndex ? highlightedColor : .clear
        let request = UITableCellStyleRequest(isTopseparatorEnabled: true, separatorColor: style.separatorColor, backgroundColor: backgroundColor)
        
        let tableCell = UITableCell(frame: frame, columnIndex: columnIndex, rowIndex: rowIndex, request: request) {
            let label: UILabel
            if columnIndex == 0 {
                label = UILabel(style: TableViewStyle.Label.tableDescriptionLabelStyle)
            } else {
                label = UILabel(style: TableViewStyle.Label.tableContentLabelStyle)
            }
            label.text = "\(title)"
            return label
        }
        
        return tableCell
    }
    
    private func setupHighlightFrame(startAt: CGPoint, endAt: CGPoint) {
        let highlightFrame = UIView(style: TableViewStyle.View.highlightedFrameStyle)
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
        trianglePieceLayer.fillColor = #colorLiteral(red: 0, green: 0.5841317773, blue: 0.7915077806, alpha: 1).cgColor
        
        trianglePiece.layer.insertSublayer(trianglePieceLayer, at: 0)
        
        let hideBorderFrame = highlightFrame.copyView()
        hideBorderFrame.apply(TableViewStyle.View.highlightedFrameHiderStyle(highlightedColor: highlightedColor))
        hideBorderFrame.transform = .identity
        superview?.addSubview(hideBorderFrame)
        
        superview?.addSubview(highlightFrame)
        highlightFrame.addSubview(trianglePiece)
        trianglePiece.layer.zPosition = 1
        
        NSLayoutConstraint.activate([
            trianglePiece.rightAnchor.constraint(equalTo: highlightFrame.rightAnchor),
            trianglePiece.topAnchor.constraint(equalTo: highlightFrame.topAnchor),
            trianglePiece.widthAnchor.constraint(equalToConstant: lineLength),
            trianglePiece.heightAnchor.constraint(equalToConstant: lineLength)
        ])
    }
}


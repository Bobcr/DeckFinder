import SwiftUI

struct CustomGrid<Content>: View where Content: View {
    
    let isLazy: Bool
    let allItemsCount: Int
    var columns: Int? = nil
    var rows: Int? = nil
    let content: (Int) -> (Content)
    
    init(isLazy: Bool = true,
         allItemsCount: Int,
         columns: Int,
         @ViewBuilder content: @escaping (Int) -> (Content)) {
        
        self.isLazy = isLazy
        self.allItemsCount = allItemsCount
        self.columns = columns
        self.content = content
    }
    
    init(isLazy: Bool = true,
         allItemsCount: Int,
         rows: Int,
         @ViewBuilder content: @escaping (Int) -> (Content)) {
        
        self.isLazy = isLazy
        self.allItemsCount = allItemsCount
        self.rows = rows
        self.content = content
    }
    
    var body: some View {
        if columns == nil {
            getHStackedContent()
        }
        else {
            getVStackedContent()
        }
    }
    
    @ViewBuilder
    private func getHStackedContent() -> some View {
        if isLazy {
            LazyHStack(spacing: 0) {
                viewContent()
            }
        }
        else {
            HStack(spacing: 0) {
                viewContent()
            }
        }
    }
    
    @ViewBuilder
    private func getVStackedContent() -> some View {
        if isLazy {
            LazyVStack(spacing: 0) {
                viewContent()
            }
        }
        else {
            VStack(spacing: 0) {
                viewContent()
            }
        }
    }
    
    @ViewBuilder
    private func viewContent() -> some View {
        if let columns = columns {
            makeContentWith(columns: columns)
        }
        else {
            makeContentWith(rows: rows!)
        }
    }
    
    @ViewBuilder
    private func makeContentWith(columns: Int) -> some View {
        let rows = Int((Double(allItemsCount)/Double(columns)).rounded(.up))
        
        ForEach(0..<rows, id: \.self) { idx in
            HStack(spacing: 0) {
                ForEach(0..<columns, id: \.self) { ind in
                    if allItemsCount > idx*columns+ind {
                        content(idx*columns+ind)
                    }
                    else {
                        content(idx*columns)
                            .opacity(0.0001)
                            .disabled(true)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func makeContentWith(rows: Int) -> some View {
        let columns = rows == 0 ? 0 :
            Int((Double(allItemsCount)/Double(rows)).rounded(.up))
        
        ForEach(0..<columns, id: \.self) { idx in
            VStack(spacing: 0) {
                ForEach(0..<rows, id: \.self) { ind in
                    if allItemsCount > idx*rows+ind {
                        content(idx*rows+ind)
                    }
                    else {
                        content(idx*rows)
                            .opacity(0.0001)
                            .disabled(true)
                    }
                }
            }
        }
    }
}

import Foundation
import SwiftUI

// this file includes the methods which are used in deck extension too,
// other than the main iOS app

extension View {
    func customFont(size: CGFloat,
                    weight: Font.Weight = .semibold,
                    design: Font.Design = .rounded,
                    id: SizingsId = .s1) -> some View {
        
        return self
            .font(.system(size: size.customize(.fromId(id)), weight: weight, design: design))
    }
}

extension View {
    func customCornerRadius(_ radius: CGFloat,
                            id: SizingsId = .s1) -> some View {
        return self
            .cornerRadius(radius.customize(.fromId(id)))
    }
}

extension EdgeInsets {
    static let zero = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
}

extension EdgeInsets {
    init(t: CGFloat,
         l: CGFloat,
         b: CGFloat,
         tr: CGFloat) {
        
        self.init(top: t,
                  leading: l,
                  bottom: b,
                  trailing: tr)
    }
}

extension EdgeInsets {
    func customize(_ id: SizingsId) -> Self {
        return .init(top: self.top.customize(.fromId(id)),
                     leading: self.leading.customize(.fromId(id)),
                     bottom: self.bottom.customize(.fromId(id)),
                     trailing: self.trailing.customize(.fromId(id)))
    }
}

extension View {
    func customPadding(_ insets: EdgeInsets,
                       id: SizingsId = .s1) -> some View {
        return self
            .padding(insets.customize(id))
    }
    
    func customPadding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil, id: SizingsId = .s1) -> some View {
        return self
            .padding(edges, length.customize(.fromId(id)))
    }
    
    func customPadding(_ length: CGFloat, id: SizingsId = .s1) -> some View {
        return self
            .padding(length.customize(.fromId(id)))
    }
    
    func customPadding(t: CGFloat = 0, l: CGFloat = 0, b: CGFloat = 0, tr: CGFloat = 0, id: SizingsId = .s1)
    -> some View {
        return self.padding(EdgeInsets(t: t, l: l, b: b, tr: tr).customize(id))
    }
    
    func padding(t: CGFloat = 0, l: CGFloat = 0, b: CGFloat = 0, tr: CGFloat = 0)
    -> some View {
        return self.padding(EdgeInsets(t: t, l: l, b: b, tr: tr))
    }
}

extension View {
    func customFrame(minWidth: CGFloat? = nil,
                     idealWidth: CGFloat? = nil,
                     maxWidth: CGFloat? = nil,
                     minHeight: CGFloat? = nil,
                     idealHeight: CGFloat? = nil,
                     maxHeight: CGFloat? = nil,
                     alignment: Alignment? = nil,
                     id: SizingsId = .s1) -> some View {
        
        return self.frame(minWidth: minWidth.customize(.fromId(id)),
                   idealWidth: idealWidth.customize(.fromId(id)),
                   maxWidth: maxWidth.customize(.fromId(id)),
                   minHeight: minHeight.customize(.fromId(id)),
                   idealHeight: idealHeight.customize(.fromId(id)),
                   maxHeight: maxHeight.customize(.fromId(id)),
                   alignment: alignment ?? .center)
    }
}

extension View {
    func customFrame(width: CGFloat? = nil,
                     height: CGFloat? = nil,
                     alignment: Alignment? = nil,
                     id: SizingsId = .s1) -> some View {
        
        return self.frame(width: width.customize(.fromId(id)),
                          height: height.customize(.fromId(id)),
                          alignment: alignment ?? .center)
    }
}

extension Button where Label == HStack<TupleView<(Text, Spacer, Image)>> {
    init(_ title: String, imageSystemName: String, action: @escaping () -> Void) {
        self.init(action: action) {
            HStack(spacing: 0) {
                Text(title)
                Spacer()
                Image(systemName: imageSystemName)
            }
        }
    }
    
    init(_ title: String, image: Image, action: @escaping () -> Void) {
        self.init(action: action) {
            HStack(spacing: 0) {
                Text(title)
                Spacer()
                image
            }
        }
    }
}

// i just dont like .background(AView())
// i rather .background(content: AView) or
// .background { AView() }
extension View {
    func background<Content: View>
    (@ViewBuilder content: @escaping () -> (Content)) -> some View {
        
        return self.background(content())
    }
}

extension View {
    /// A way to create a menu button. makes it easy to replace contextMenus with menus, you'll
    /// just need to replace `.contextMenu` with `.menu`
    func menu<Content: View>(@ViewBuilder menuItems: @escaping () -> (Content)) -> Menu<Self, Content> {
        return Menu(content: menuItems, label: { self })
    }
}

struct CustomScrollView<Content: View>: View {
    
    var axis: Axis.Set
    var spacing: CGFloat
    var showsIndicators: Bool
    var content: () -> Content
    
    init(_ axis: Axis.Set = .vertical,
         spacing: CGFloat = 0,
         showsIndicators: Bool = true,
         @ViewBuilder content: @escaping () -> Content) {
        
        self.axis = axis
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.content = content
    }
    
    var body: some View {
        ScrollView.init(axis, showsIndicators: showsIndicators) {
            VStack(spacing: spacing) {
                content()
            }
        }
    }
}

extension View {
    func readGeometry(proxy: Binding<GeometryProxy?>) -> some View {
        GeometryReader { geo in
            self.onAppear {
                proxy.wrappedValue = geo
            }
        }
    }
}

extension Font {
    static let navigationBarImage: Font = Device.navigationBarImageFont
    static let navigationBarText: Font = Device.navigationBarTextFont
}

extension View {
    func ifDebug<NewContent: View>(content: (Self) -> NewContent) -> some View {
        #if DEBUG
        return content(self)
        #else
        return self
        #endif
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, newContent: (Self) -> Content) -> some View {
        if condition {
            newContent(self)
        }
        else {
            self
        }
    }
}

extension View {
    func fixedSize(_ axis: Axis...) -> some View {
        return self.fixedSize(horizontal: axis.contains(.horizontal),
                              vertical: axis.contains(.vertical))
    }
}

@ViewBuilder
func IPadBackButton(title: String,
                    presentationMode: Binding<PresentationMode>) -> some View {
    if Device.isPad {
        HStack(spacing: 0) {
            Spacer(minLength: Device.navigationBarItemSpacing)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            })
            {
                HStack {
                    Text(title)
                        .font(Device.navigationBarTextFont)
                }
            }
        }
    }
}

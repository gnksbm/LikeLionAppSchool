//
//  ContentView.swift
//  ChartUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI
import Charts

struct ContentView: View {
    let words: [String] = "김건섭,박지성,원강묵,한아리,박재민,정석호,안효명".components(separatedBy: ",")
    
    @State private var isCircle: Bool = true
    @State private var angle: Angle = .zero
    @State private var keyword: String = "Touch"
    @Namespace private var namespace
    
    public var body: some View {
        ZStack {
            GeometryReader { proxy in
                let midX = Int(proxy.size.width / 2.0)
                let midY = Int(proxy.size.height / 2.0)
                ZStack {
                    Color.clear
                    ZStack {
                        Color.clear
                        ForEach(Array(self.words.enumerated()), id: \.offset) { index, word in
                            if isCircle {
                                RowView(word: word, width: CGFloat(min(midX, midY)))
                                    .matchedGeometryEffect(id: index, in: namespace)
                                    .frame(width: min(proxy.size.width, proxy.size.height))
                                    .foregroundColor(index%2 == 0 ? Color.secondary : Color.red)
                                    .rotationEffect(.degrees(Double(index) / Double(self.words.count)) * 360)
                                
                            } else {
                                let opacity = CGFloat.random(in: 0.2...1.0)
                                RowView(word: word, width: CGFloat(min(midX, midY)))
                                    .matchedGeometryEffect(id: index, in: namespace)
                                    .frame(width: min(proxy.size.width, proxy.size.height))
                                    .foregroundColor(Color.secondary)
                                    .rotationEffect(Angle(degrees: CGFloat(Int.random(in: 0...270))))
                                    .offset(x: CGFloat(Int.random(in: -midX...midX)),
                                            y: CGFloat(Int.random(in: -midY...midY)))
                                    .scaleEffect(index%2 == 0 ? opacity * 2.0 : opacity * 5.0)
                                    .opacity(opacity)
                            }
                        }
                        .rotationEffect(angle)
                        VStack {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(keyword)
                                .bold()
                                .shadow(color: Color.black.opacity(0.5), radius: 6, x: 0, y: 0)
                                .font(.title)
                                .font(.largeTitle)
                                .animation(.easeInOut(duration: 0.24), value: keyword)
                        }
                    }
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1.0)) {
                isCircle.toggle()
                if !isCircle {
                    keyword = self.words[Int.random(in: 0..<self.words.count)]
                }
            }
            withAnimation(.easeInOut(duration: 1.0)) {
                angle = Angle(degrees: CGFloat(Int.random(in: 0...270)))
            }
        }
        .padding()
    }
    
    private func getCircularValue(_ current: Double, _ total: Double) -> CGFloat {
        let x = Double(current) / Double(total)
        let y = (sin(-1 * .pi * x - (.pi / 1)) + 1) / 2.0
        return y
    }
    
    private func getFontSize(_ proxy: GeometryProxy) -> CGFloat {
        return proxy.size.width / 2 * 0.1
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    //
    //  MVHomeView.swift
    //  GrabArchitecture
    //
    //  Created by Fadhli Firdaus on 14/02/2024.
    //

import Foundation
import SwiftUI
import CodeScanner


#Preview {
    MVHomeView()
}

struct MVHomeView:View {
    @State var cameraTapped = false
    @State var bannerRetrieved = false
    var body: some View {
        ZStack{
            GeometryReader {reader in
                ScrollView(.vertical){
                    VStack(spacing:0){
                        BannerCardView(bannerRetrieved: $bannerRetrieved)
                        SearchBarView(cameraTapped: $cameraTapped)
                            .padding(.top, -reader.safeAreaInsets.top)
                            .padding(.top, -screenWidth/7/2)
                        LogosList()
                        Spacer()
                            .frame(height: 10)
                        CardListView()
                        let randomizer = [AnyView(OrderAgainCards()), AnyView(CardPager())].shuffled()
                        ForEach(randomizer, id: \.uniqueIdentifier){view in
                            view
                        }
                        Spacer()
                            .frame(height: 200)
                    }
                }
            }
        }
        .sheet(isPresented: $cameraTapped) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
        }
        
        .ignoresSafeArea()
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        cameraTapped = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            d("qr is : \(details)")
            guard details.count == 2 else { return }
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
}

struct CardPager:View{
    @State var commercialCards:[CommercialCard] = mockCommercialCards
    var body: some View {
        if(commercialCards.isEmpty){
            EmptyView()
        } else {
            ScrollView(.horizontal){
                VStack{
                    HStack{
                        ForEach(Array(commercialCards.enumerated()), id: \.element.self) { index, card in
                            VStack{
                                HStack{
                                    Button {
                                        
                                    } label: {
                                        HStack{
                                            Text("\(card.ccCTAText)")
                                                .foregroundColor(.black)
                                            Spacer().frame(width: 12)
                                            Image(systemName: "arrow.right")
                                                .scaleEffect(0.8)
                                                .background(Circle()
                                                    .scaleEffect(1.5)
                                                    .foregroundColor(Color.gray.opacity(0.15)))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    Spacer()
                                }
                                HStack {
                                    let randomColor = getRandomColor()
                                    CardViewUI(color: randomColor.opacity(0.15))
                                        .frame(width: screenWidth - 20, height: screenHeight/4, alignment: .leading)
                                    Spacer().frame(width: 20)
                                }
                                HStack {
                                    Text("\(card.ccShortDesc)")
                                        .textModifier(size: 17, weight: .heavy)
                                    Spacer()
                                }
                            }
                            .frame(width: screenWidth, height: screenHeight/2.5, alignment: .leading)
                            .scaleEffect(0.95)
                            .padding(.trailing, index == commercialCards.count - 1 ? 0 : -30)
                        }
                    }
                }
                .frame(height: screenHeight/3, alignment: .leading)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
//            .debugRed()
        }
    }
}

struct OrderAgainCards:View {
    @State var historyList:[HistoryModel] = []
    var body: some View {
        VStack{
            if(historyList.isEmpty){
                EmptyView()
            } else {
                VStack{
                    HStack {
                        Text("Order food again")
                            .padding(12)
                        Spacer()
                    }
                    ScrollView (.horizontal){
                        HStack(spacing:0){
                            ForEach(historyList, id: \.self){history in
                                VStack(spacing:0){
                                    Image(history.restaurantRes)
                                        .resizable()
                                        .frame(width: screenWidth/3.25, height: screenWidth/3.25)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                    VStack (alignment: .leading, spacing:0){
                                        Text("\(history.restaurantName)")
                                            .multilineTextAlignment(.leading)
                                            .textModifier(size: 16, weight: .bold)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        let formattedFloat = formatFloatToNDecimalPlaces(history.restaurantDistance, n: 2)
                                        Text("\(formattedFloat) km")
                                            .textModifier(size: 15, weight: .light)
                                            .foregroundColor(Color.gray.opacity(0.5))
                                    }
                                    .frame(width: screenWidth/3.5, alignment: .leading)
                                    Spacer()
                                        .frame(height: 8)
                                    if(history.topOffer != .noOffer){
                                        let offerString = getOfferString(offerType: history.topOffer, offerValue: history.offerValue)
                                        HStack {
                                            Spacer()
                                            Text("\(offerString)")
                                                .frame(height: 20)
                                                .frame(alignment: .trailing)
                                                .defaultTextModifier()
                                                .background(Color.yellow.opacity(0.3))
                                        }
                                    } else {
                                        Spacer()
                                            .frame(height: 20)
                                    }
                                }
                                .padding([.trailing, .leading], 6)
                                .frame(alignment: .center)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .frame(width: screenWidth, height: screenHeight/4.5, alignment: .top)
                }
                .frame(width: screenWidth, height: screenHeight/3.5, alignment: .top)
                
                .onAppear(perform: {
                    historyList = historyList.shuffled()
                })
            }
        }
        .frame(height: historyList.isEmpty ? 10:screenHeight/3.5)
        .onAppear(perform: {
            fetchHistory()
        })
    }
    
    func fetchHistory(){
        let randomDelayInSeconds = Double.random(in: 1...2)
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelayInSeconds) {
            historyList = mockPurchaseHistories
        }
    }
    
    func getOfferString(offerType:Offer, offerValue:Int) -> String{
        let offer = offerType
        var offerString = ""
        let value = offerValue
        switch(offer){
        case .delivery:
            offerString = "RM\(value) off on delivery!"
        case .discount:
            offerString = "\(value)% discount!"
        case .unlimited:
            offerString = "RM\(value) unlimited saving!"
        default:
            offerString = ""
        }
        return offerString
    }
}

struct CardListView:View {
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing:0){
                ForEach(0..<cards.count, id: \.self){
                    let data = cards[$0]
                    HStack{
                        VStack(alignment: .leading, spacing:0){
                            Spacer()
                            Text("\(data.0)")
                                .fixedSize()
                            Spacer()
                            Text("\(data.1)")
                                .fixedSize()
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(20)
                        VStack(spacing:0){
                            Spacer()
                            Image(systemName: data.2)
                                .foregroundColor(Color.green)
                                .bold()
                                .scaleEffect(1.2)
                            Spacer()
                                .frame(height: 5)
                        }
                        .padding(5)
                    }
                    .frame(height: screenWidth/6, alignment: .center)
                    .background(
                        CardViewUI(color: Color.gray.opacity(0.05))
                    )
                    .padding(6)
                }
            }
        }
        .padding(5)
        .scrollIndicators(.hidden)
    }
}

struct SearchBarView: View {
    @State var searchText = ""
    @Binding var cameraTapped:Bool
    var body: some View {
        HStack(spacing:0){
            Spacer()
                .frame(width: 10)
            CardButtonWithImage(systemName: "barcode.viewfinder")
                .frame(width: screenWidth/7, height: screenWidth/7, alignment: .center)
                .onTapGesture {
                    cameraTapped.toggle()
                }
            
            Spacer()
                .frame(width: 10)
            
            SearchBarWithFavourite()
            
            Spacer()
                .frame(width: 10)
        }
        .padding(.zero)
    }
}

struct LogosList: View {
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<logos.count, id:\.self){index in
                VStack(spacing:0){
                    if index != 3 {
                        Image(logos[index].1)
                            .resizable()
                            .frame(width: screenWidth/4, height: screenWidth/4, alignment: .center)
                            .scaledToFit()
                            .scaleEffect(0.5)
                    } else {
                        GreenCircleWithImage(systemName: logos[index].1)
                            .scaleEffect(2/3)
                    }
                    Text("\(logos[index].0)")
                        .font(Font.custom("inter", size: 15))
                }
                .frame(alignment: .center)
            }
        }
    }
}

struct GreenCircleWithImage: View {
    let systemName:String
    var body: some View {
        ZStack {
            Circle().foregroundColor(Color.green)
                .frame(width: screenWidth/6, height: screenWidth/6, alignment: .center)
                .opacity(0.15)
            Image(systemName: self.systemName)
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth/4, height: screenWidth/4, alignment: .center)
                .scaleEffect(0.5)
                .foregroundColor(Color.green)
        }
    }
}

struct SearchBarWithFavourite: View {
    @State var searchText = ""
    var body: some View {
        ZStack {
            CardViewUI()
                .frame(height: screenWidth/7)
            HStack(spacing:0){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: screenWidth/7, height: screenWidth/7, alignment: .center)
                    .scaleEffect(0.4)
                VStack(spacing:0){
                    Spacer()
                    TextField("Search Food", text: $searchText)
                    Spacer()
                }
                Divider()
                    .frame(height: screenWidth/7)
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: screenWidth/7, height: screenWidth/7, alignment: .center)
                    .scaleEffect(0.4)
            }
        }
        .frame(height: screenWidth/7, alignment: .center)
    }
}

struct CardButtonWithImage: View {
    let systemName:String
    var body: some View {
        ZStack {
            CardViewUI()
            Image(systemName: systemName)
                .resizable()
                .padding(12)
        }
    }
}

struct BannerCardView: View {
    @State var bannerData:BannerAd?
    @Binding var bannerRetrieved:Bool
    @State var bannerOpacity = 0.0
    @State var heightOfRect = screenHeight/10
    @State var showWebView = false
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: screenWidth, height: heightOfRect, alignment: .top)
                .foregroundColor(.pink.opacity(0.33))
                .ignoresSafeArea()
            if (bannerRetrieved){
                HStack(spacing:0){
                    Spacer()
                    VStack {
                        Spacer()
                        Image("pngjaya")
                            .resizable()
                            .frame(width: screenWidth/2, height: screenHeight/7, alignment: .center)
                            .scaledToFit()
                            .opacity(0.5)
                        Spacer()
                            .frame(height: 20)
                    }
                }
                .opacity(bannerOpacity)
                VStack(alignment:.leading, spacing:0) {
                    Spacer()
                        .frame(height: screenHeight/20)
                    Text("Exclusive Deals for Jaya Grocer Members")
                        .bold()
                    Spacer().frame(height: 5)
                    Button(action: {
                        showWebView.toggle()
                    }, label: {
                        HStack(spacing:0){
                            Text("Shop in-store or on GrabMart")
                            Spacer().frame(width: 10)
                            Image(systemName: "arrow.right.circle")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                            Spacer()
                        }
                    })
                    Spacer()
                }
                .padding(10)
                .frame(width: screenWidth, height: screenHeight/3.5, alignment: .center)
                .opacity(bannerOpacity)
            }
        }
        .frame(width: screenWidth, height: heightOfRect, alignment: .top)
        .onAppear(perform: {
            fetchAds()
        })
        .sheet(isPresented: $showWebView, content: {
            WebViewContainer(urlString: bannerData?.bannerIntent ?? "google.com")
        })
        
    }
    
    func fetchAds() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            withAnimation(.spring){
                bannerData = mockAd
                bannerRetrieved = true
                bannerOpacity = 1.0
                heightOfRect = screenHeight/3.5
            }
            
        }
    }
}

// 모델 정의
struct SavedModel {
    let SavedImage: String
    let SavedName: String
    let SavedImageDescription: String
    var SavedPrice: Double
    let SavedCheck: String
    
    init(SavedImage: String, SavedName: String, SavedImageDescription: String, SavedPrice: Double, SavedCheck: String) {
        self.SavedImage = SavedImage
        self.SavedName = SavedName
        self.SavedImageDescription = SavedImageDescription
        self.SavedPrice = SavedPrice
        self.SavedCheck = SavedCheck
    }
}

// 더미 데이터 클래스
final class dummySavedModel {
    // 싱글톤으로 더미 데이터 사용
    static let SavedDatas: [SavedModel] = [
        SavedModel(SavedImage: "productImage1", SavedName: "손오공이 잃어버린 머리띠 반쪽", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 99994.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage2", SavedName: "골드 반지", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 12384.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage3", SavedName: "하얀 신발", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 123241234.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage4", SavedName: "에베레스트 다이아 반지", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 12234.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage5", SavedName: "아디다스다 신발", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 123234.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage6", SavedName: "황제 잠옷", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 1241234.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage7", SavedName: "고장난 기타", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 1232123534.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage8", SavedName: "카리나는 신이야", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 11235241234.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage9", SavedName: "손흥민이 짱이야", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 123241234.0, SavedCheck: "checkImage.png"),
        SavedModel(SavedImage: "productImage10", SavedName: "손오공은 바보야", SavedImageDescription: "손오공이 잃어버렸어요 머리띠 팝니다", SavedPrice: 123241234.0, SavedCheck: "checkImage.png")
    ]
}

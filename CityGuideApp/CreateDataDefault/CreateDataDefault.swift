//
//  CreateDataDefault.swift
//  CityGuide
//
//  Created by Trương Quốc Tài on 8/14/19.
//  Copyright © 2019 Trương Quốc Tài. All rights reserved.
//

import Foundation

class CreateDataDefault {
    static let share = CreateDataDefault()

    func CreateListCity() -> [CityModal]{
        //create data city
        let ct1 = CityModal.init("Hồ Chí Minh", "imgHoChiMinh",10)
        let ct2 = CityModal.init("Hà Nội", "imgHaNoi",9)
        let ct3 = CityModal.init("Đà Nẵng", "imgDaNang",8)
        let ct4 = CityModal.init("Đà Lạt", "imgDalat",7)
        let ct5 = CityModal.init("Huế", "imgHue",10)
        let ct6 = CityModal.init("Vũng Tàu", "imgVungTau",9)
        let ct7 = CityModal.init("Cần Thơ", "imgCanTho",8)
        let ct8 = CityModal.init("Phan Thiết", "imgPhanThiet",7)
        let ct9 = CityModal.init("Quảng Ninh", "imgQuangNinh",6)
        let ct10 = CityModal.init("Sapa", "imgSapa",5)
        let ct11 = CityModal.init("Nha Trang", "imgNhaTrang",6)
        let ct12 = CityModal.init("Nghệ An", "imgNgheAn",7)
        let ct13 = CityModal.init("Hà Tĩnh", "imgHaTinh",6)
        let ct14 = CityModal.init("Quảng Bình", "imgQuangBinh",4)
        let ct15 = CityModal.init("Ninh Thuận", "imgNinhThuan",8)
        let ct16 = CityModal.init("Ninh Bình", "imgNinhBinh",9)
        let ct17 = CityModal.init("Thái Bình", "imgThaiBinh",6)
        let ct18 = CityModal.init("Tây Ninh", "imgTayNinh",7)
        let ct19 = CityModal.init("Hòa Bình", "imgHoaBinh",6)
        let ct20 = CityModal.init("Bến Tre", "imgBenTre",5)
        return [ct1,ct2,ct3,ct4,ct5,ct6,ct7,ct8,ct9,ct10,ct11,ct12,ct13,ct14,ct15, ct16,ct17,ct18,ct19,ct20]
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(listCityData), forKey :"listCity")
    }
    func CreateListMarker(cityName: String) ->[MarkerModal]{
        switch cityName {
        case "Hồ Chí Minh":
            let m1 = MarkerModal.init("CHỢ BẾN THÀNH","HỒ CHÍ MINH", LocationModal.init(10.772830, 106.698031))
            let m2 = MarkerModal.init("DINH ĐỘC LẬP","HỒ CHÍ MINH", LocationModal.init(10.777354, 106.695480))
            let m3 = MarkerModal.init("BƯU ĐIỆN TRUNG TÂM SÀI GÒN","HỒ CHÍ MINH", LocationModal.init(10.780121, 106.699886))
            let m4 = MarkerModal.init("NHÀ THỜ ĐỨC BÀ","HỒ CHÍ MINH", LocationModal.init(10.780133, 106.699008))
            let m5 = MarkerModal.init("PHỐ ĐI BỘ NGUYỄN HUỆ","HỒ CHÍ MINH", LocationModal.init(10.775975, 106.703081))
            let m6 = MarkerModal.init("BẢO TÀNG HỒ CHÍ MINH","HỒ CHÍ MINH", LocationModal.init(10.768523, 106.706474))
            let m7 = MarkerModal.init("HỒ BÁN NGUYỆT – CẦU ÁNH SAO","HỒ CHÍ MINH", LocationModal.init(10.724983, 106.718805))
            let m8 = MarkerModal.init("KHU DU LỊCH BCR","HỒ CHÍ MINH", LocationModal.init(10.807113, 106.841546))
            let m9 = MarkerModal.init("FAMILY GARDEN THẢO ĐIỀN","HỒ CHÍ MINH", LocationModal.init(10.805840, 106.738081))
            let m10 = MarkerModal.init("KHU DU LỊCH SINH THÁI LÀNG DÂN TỘC FOSACO","HỒ CHÍ MINH", LocationModal.init(11.041283, 106.495916))
            return [m1,m2,m3,m4,m5,m6,m7,m8,m9,m10]
        default:
            return []
        }
    }
    
    func CreateListPlaceOfCity()-> [placeOfCityModal] {
        //create data place
        //data ho chi minh
        let hcm1 = PlaceModal.init("CHỢ BẾN THÀNH", "Phan Bội Châu, phường Bến Thành, Quận 1", "Chợ Bến Thành không là là chợ truyền thống lưu giữ những nét văn hóa truyền thống của đất Việt mà còn là biểu tượng du lịch của Sài thành. Đến Sài Gòn, bạn đừng quên dạo một vòng chợ Bến Thành để tham quan và mua sắm những món quà lưu niệm nhé!", "imgHcmChoBenThanh", 5)
        let hcm2 = PlaceModal.init("DINH ĐỘC LẬP","135 Nam Kỳ Khởi Nghĩa, phường Bến Thành, Quận 1" , "Dinh Độc Lập là di tích quốc gia đặc biệt, lưu giữ nhiều dấu ấn của lịch sử, những biến cố chính trị trong thế kỷ XX. Tham quan dinh Độc Lập, bạn sẽ được tìm hiểu lịch sử, ngắm nhìn những hiện vật có giá trị, chiêm ngưỡng kiến trúc độc đáo, đồ sộ giữa trung tâm Sài thành và được tận hưởng bầu không khí trong lành trong khuôn viên xanh mát.", "imgHcmDinhDocLap", 5)
        let hcm3 = PlaceModal.init("BƯU ĐIỆN TRUNG TÂM SÀI GÒN", "2 Công xã Paris, phường Bến Nghé, Quận 1", "Trải qua hơn 130 năm, bưu điện trung tâm vẫn là một trong những công trình kiến trúc tiêu biểu, độc đáo ở Sài thành với những mái vòm cong tròn, họa tiết sắc sảo, tinh tế. Đến với bưu điện, bạn còn có thể mua vài món quà kỷ niệm đáng yêu, gửi postcard xinh xắn đến gia đình, bạn bè và chụp ảnh lưu niệm nữa đấy!", "imgHcmBuuDienTrungTamSaiGon", 5)
        let hcm4 = PlaceModal.init("NHÀ THỜ ĐỨC BÀ", "2 Công xã Paris, phường Bến Nghé, Quận 1", "Nhà thờ Đức Bà (có tên gọi chính thức là Vương cung Thánh đường Chính tòa Đức Mẹ vô nhiễm Nguyên tội) không chỉ là nhà thờ chính tòa, nơi thực hiện các nghi lễ và cầu nguyện của tín hữu Công giáo mà còn là tuyệt tác kiến trúc của Sài thành. Ngắm nhìn bầu trời trong xanh, nhà thờ bình yên với những đàn bồ câu bay lượn bạn sẽ thấy Sài thành tươi đẹp, thân thiện và yên bình biết nhường nào!", "imgHcmNhaThoDucBa", 5)
        let hcm5 = PlaceModal.init("PHỐ ĐI BỘ NGUYỄN HUỆ", "Nguyễn Huệ, phường Bến Nghé, Quận 1", "Nét đẹp của phố đi bộ Nguyễn Huệ luôn đổi thay theo thời gian, có khi tĩnh lặng, yên bình với dòng người thưa thớt mỗi sớm ban mai và sẽ lại nhộn nhịp, rộn rã tiếng cười dòng người đông đúc rong chơi trong buổi tối mỗi khi Sài thành lên đèn. Lang thang phố đi bộ bạn cũng đừng quên viếng thăm tượng Bác – vị lãnh tụ kính yêu của dân tộc nhé!", "imgHcmPhoDiBoNguyenHue", 5)
        let hcm6 = PlaceModal.init("BẢO TÀNG HỒ CHÍ MINH", "1 Nguyễn Tất Thành, phường 12, quận 4", "Bến Nhà Rồng từng là thương cảng lớn của Sài Gòn, là nơi Bác ra đi tìm đường cứu nước. Ngày nay, bảo tàng Hồ Chí Minh - bến Nhà Rồng là nơi bạn có thể tìm hiểu, củng cố những kiến thức lịch sử, được nghe kể những câu chuyện gắn liền với cuộc đời Bác và ngắm nhìn những hiện vật còn được lưu giữ, trưng bày trong bảo tàng.", "imgHcmBaoTangHoChiMinh", 5)
        let hcm7 = PlaceModal.init("HỒ BÁN NGUYỆT – CẦU ÁNH SAO", "Tôn Dật Tiên, phường Tân Phú, quận 7", "Hồ Bán Nguyệt – cầu Ánh Sao là điểm hẹn lý tưởng để bạn ngắm bình minh rực rỡ,  hoàng hôn lung linh, bầu trời đêm lấp lánh ánh sao. Ngoài ra bạn còn có thể chiêm những ánh đèn uốn cong rực sáng với dải màu nổi bật gợi nên khung cảnh mộng mơ, đẹp huyền diệu đến lạ lùng.", "imgHcmHoBanNguyet", 10)
        let hcm8 = PlaceModal.init("KHU DU LỊCH BCR", "191 đường Tam Đa, phường Trường Thạnh, quận 9", "Đến với khu du lịch BCR, du khách sẽ được tận hưởng không gian xanh mát, tha hồ vui chơi với nhiều hoạt động giải trí thú vị, độc đáo như bắn súng sơn, bắn trái cây, chơi golf, chèo thuyền kayak, lướt phao, chơi tennis và được bơi lội thỏa thích ở hồ bơi có diện tích rộng lớn. Ngoài ra, bạn còn hóa thân thành nông dân, học cách trồng rau, trồng lúa, chế biến rượu và làm gốm nữa đấy!", "imgHcmKhuDuLichBRC", 4)
        let hcm9 = PlaceModal.init("FAMILY GARDEN THẢO ĐIỀN", "28 Thảo Điền, phường Thảo Điền, quận 2", "Ngay ở Sài Gòn, bạn cũng được đắm mình trong không gian như đang ở vùng quê nông thôn bình dị, thanh bình với Family Garden. Nơi đây không chỉ mang đến hơi thở thiên nhiên trong lành, tươi mát mà còn là sẽ là nơi khiến bạn hào hứng, thích thú trải nghiệm cuộc sống mộc mạc, được làm vườn trồng rau, chăm sóc vườn hoa, câu cá, nấu các món ăn thuần Việt từ chính nông sản vừa thu hoạch.", "imgHcmFamilyGardenThaoDien", 4)
        let hcm10 = PlaceModal.init("KHU DU LỊCH SINH THÁI LÀNG DÂN TỘC FOSACO", "Xã Nhuận Đức, huyện Củ Chi", "Khu sinh thái làng dân tộc Fosaco được ví von như “Tây Nguyên giữa lòng thành phố” với vẻ đẹp hoang dã của núi rừng và không gian mang đậm nét văn hóa của đồng bào dân tộc thiểu số. Bạn có thể cùng ngắm cảnh thiên nhiên trữ tình, thơ mộng, khám phá nét sinh hoạt truyền thống của bản làng dân tộc, tham gia những trò chơi thú vị và thưởng thức những bữa ăn với hương vị khó quên.", "imgKhuDuLichSinhThaiLangDanTocFOSACO", 4)
        let listPlaceDataHcm: [PlaceModal] = [hcm1,hcm2,hcm3,hcm4,hcm5,hcm6,hcm7,hcm8,hcm9,hcm10]
        //data Ha Noi
        
        
        let listPlaceDataHaNoi:[PlaceModal] = []
        //data Da Nang
        
        //data Da Lat
        
        //data Vung Tau
        
        //===>>create data place of city
        let placeHCM = placeOfCityModal.init("Hồ Chí Minh", listPlaceDataHcm)
        let placeHaNoi = placeOfCityModal.init("Hà Nội", listPlaceDataHaNoi)
        return [placeHCM,placeHaNoi]
//
    }
    
    func CreateListAllPlace() -> [PlaceModal]{
        let placeCity = CreateListPlaceOfCity()
        var allPlaceCity = [PlaceModal]()
        for city in placeCity {
            if city.listPlaceName.count == 0
            {
                continue
            }
            for i in 0...(city.listPlaceName.count-1) {
              allPlaceCity.append(city.listPlaceName[i])
            }
            
        }
        return allPlaceCity
    }
    func CreateListReviewForPlace(){
        let rv1 = ReviewModal.init("01.08.2019", "Vũ Thị Lan", "imgrv1", "Đã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lầnĐã từ đến đây 1 lần")
        let rv2 = ReviewModal.init("02.08.2019", "Nguyễn Phan Anh Thư", "imgrv2", "Đã từ đến đây 1 lần")
        let rv3 = ReviewModal.init("02.08.2019", "Nguyễn Lê Hải Sơn", "imgrv3", "Đã từ đến đây 1 lần")
        let rv4 = ReviewModal.init("03.08.2019", "Lê Loan", "imgrv4", "Đã từ đến đây 1 lần")
        let rv5 = ReviewModal.init("04.08.2019", "Nguyễn An Khang", "imgrv", "Đã từ đến đây 1 lần")
        let rv6 = ReviewModal.init("04.08.2019", "Lê Bá Minh", "imgrv", "Đã từ đến đây 1 lần")
        let rv7 = ReviewModal.init("04.08.2019", "Lê Thanh Nhàn", "imgrv", "Đã từ đến đây 1 lần")
        let rv8 = ReviewModal.init("06.08.2019", "Hồ Thị Thảo Ngân ", "imgrv", "Đã từ đến đây 1 lần")
        let rv9 = ReviewModal.init("08.08.2019", "Nguyễn Quỳnh Như", "imgrv", "Đã từ đến đây 1 lần")
        let rv10 = ReviewModal.init("10.08.2019", "Phạm Thị Thủy", "imgrv", "Đã từ đến đây 1 lần")
        let rv11 = ReviewModal.init("11.08.2019", "Huỳnh Văn Tân", "imgrv", "Đã từ đến đây 1 lần")
        let rv12 = ReviewModal.init("11.08.2019", "Nguyễn Thị Ngọc Thanh", "imgrv", "Đã từ đến đây 1 lần")
        let rv13 = ReviewModal.init("17.08.2019", "Nguyễn Huyền Trang", "imgrv", "Đã từ đến đây 1 lần")
        let rv14 = ReviewModal.init("21.08.2019", "Trương Văn Quang", "imgrv", "Đã từ đến đây 1 lần")
        let listReview = [rv1,rv2,rv3,rv4,rv5,rv6,rv7,rv8,rv9,rv10,rv11,rv12,rv13,rv14]
        Utilities.share.setListReview(listReview)
    }
    
    func CreateListGift() ->[GiftModal]{
        let gift1 = GiftModal.init("Voucher giảm giá 10% tại The Coffee House", "imgTheCoffeeHouse10", 100, 10)
        let gift2 = GiftModal.init("Voucher giảm giá 50% tại The Coffee House", "imgTheCoffeeHouse50", 100, 50)
        return [gift1,gift2]
    }
}


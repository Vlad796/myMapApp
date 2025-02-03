//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit
import _MapKit_SwiftUI

//Тут написан масиив с содержанием каждой достапримичательности MapCameraPosition.region(MKCoordinateRegion(latitude: 41.8902, longitude: 12.4922), latitude: 45.046525, longitude: 38.978352
/*
 
 */


class LocationsDataService {
    
    static let locations: [locationsModel] = [
        
        
        //Памятник Кубанскому казачеству
        locationsModel(name: "Памятник Кубанскому казачеству",
                 cityName: "Краснодар",
                 coordinates: CLLocationCoordinate2D(latitude: 45.024595, longitude: 38.969976),
                 description: "Алекса́ндровская триумфа́льная а́рка (также Ца́рские воро́та) — памятник в русском стиле в центре Краснодара, расположенный на пересечении двух улиц — Красной и Бабушкина. Возведена к визиту Императора Александра III вместе с августейшей семьёй в Екатеринодар в 1888 году. Разрушена в 1928 году, восстановлена в 2008 году на новом месте.",
                 imageNames: [
                    "russia-MonumentToTheKubanCossacks-1",
                    "russia-MonumentToTheKubanCossacks-2",
                    "russia-MonumentToTheKubanCossacks-3"
                 ],
                 link: "https://ru.wikipedia.org/wiki/Царские_ворота_(Краснодар)"),
        
        //Царские ворота
        locationsModel(name: "Александровская арка",
                 cityName: "Краснодар",
                 coordinates: CLLocationCoordinate2D(latitude: 45.046525, longitude: 38.978352),
                 description: "Алекса́ндровская триумфа́льная а́рка (также Ца́рские воро́та) — памятник в русском стиле в центре Краснодара, расположенный на пересечении двух улиц — Красной и Бабушкина. Возведена к визиту Императора Александра III вместе с августейшей семьёй в Екатеринодар в 1888 году. Разрушена в 1928 году, восстановлена в 2008 году на новом месте.",
                 imageNames: [
                    "russia-AlexanderArch-1",
                    "russia-AlexanderArch-2",
                    "russia-AlexanderArch-3"
                 ],
                 link: "https://ru.wikipedia.org/wiki/Царские_ворота_(Краснодар)"),
        
        //Колезей
        locationsModel(
            name: "Колизей",
            cityName: "Рим",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "Колизе́й (лат. Colosseus, colosseum — исполинский), или амфитеатр Флавиев (лат. Amphitheatrum Flavium) — амфитеатр, памятник архитектуры Древнего Рима, наиболее известное и одно из самых грандиозных сооружений Древнего мира, сохранившихся до нашего времени. Находится в Риме, в низине между Эсквилинским, Палатинским и Целиевым холмами.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        
        //Пантеон
        locationsModel(
            name: "Пантеон",
            cityName: "Рим",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            description: "Пантео́н (др.-греч. πάνθειον, от др.-греч. πάντες — все и θεός — Бог) — так называемый «Храм всех богов», выдающийся памятник истории и архитектуры древнего Рима, построенный между 118 и 128 годами н. э.",
            imageNames: [
                "rome-pantheon-1",
                "rome-pantheon-2",
                "rome-pantheon-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        
        //Фонтан Твери
        locationsModel(
            name: "Фонтан Треви",
            cityName: "Рим",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            description: "Фонта́н Тре́ви (итал. Fontana di Trevi) — самый крупный фонтан Рима; вместе с фасадом примыкающего к нему здания, являющийся частью величественной архитектурно-скульптурной композиции в стиле позднего римского барокко с элементами неоклассицизма. Фонтан построен в 1732—1762 годах по проекту архитектора Николо Сальви. Скульптурную отделку фонтана, а именно статуи Нептуна и аллегорий воды создал известный итальянский скульптор барокко Джованни Лоренцо Бернини.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        
        //Эльфелева башня
        locationsModel(
            name: "Эйфелева башня",
            cityName: "Париж",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "Э́йфелева ба́шня (фр. tour Eiffel, МФА: [tu.ʁ‿ɛ.fɛl]) — металлическая башня в центре Парижа, самая узнаваемая его архитектурная достопримечательность. Названа в честь главного конструктора Гюстава Эйфеля; сам Эйфель называл её просто «300-метровая башня» (tour de 300 mètres).",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        
        //Лувр
        locationsModel(
            name: "Лувр",
            cityName: "Париж",
            coordinates: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            description: "Музей Лувра (фр. Musée du Louvre; часто используется просто название Лувр) — один из крупнейших и самый популярный художественный музей мира. Музей расположен в центре Парижа, на правом берегу Сены, на улице Риволи, в 1-м округе столицы. В 2018 году число посетителей Лувра превысило 10 млн человек, что является рекордом. Здание музея — старинный королевский дворец (Palais du Louvre). Конная статуя Людовика XIV обозначает точку начала так называемой исторической оси Парижа.",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        
    ]
    
}

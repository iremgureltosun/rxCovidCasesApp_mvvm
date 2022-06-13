//
//  File.swift
//  ArkCovid
//
//  Created by irem TOSUN on 9.06.2022.
//

import Foundation

// MARK: - Welcome8
struct Welcome8 {
    let afghanistan, albania, algeria, andorra: Afghanistan
    let angola, antarctica, antiguaAndBarbuda, argentina: Afghanistan
    let armenia: Afghanistan
    let australia: Australia
    let austria, azerbaijan, bahamas, bahrain: Afghanistan
    let bangladesh, barbados, belarus: Afghanistan
    let belgium: Belgium
    let belize, benin, bhutan, bolivia: Afghanistan
    let bosniaAndHerzegovina, botswana: Afghanistan
    let brazil: Brazil
    let brunei, bulgaria, burkinaFaso: Afghanistan
    let burma: Burma
    let burundi: Afghanistan
    let caboVerde: Burma
    let cambodia, cameroon: Afghanistan
    let canada: Canada
    let centralAfricanRepublic, chad: Afghanistan
    let chile: Chile
    let china: China
    let colombia: Colombia
    let comoros: Afghanistan
    let congoBrazzaville, congoKinshasa: Burma
    let costaRica, coteDIvoire, croatia, cuba: Afghanistan
    let cyprus, czechia: Afghanistan
    let denmark: Denmark
    let diamondPrincess: Burma
    let djibouti, dominica, dominicanRepublic, ecuador: Afghanistan
    let egypt, elSalvador, equatorialGuinea, eritrea: Afghanistan
    let estonia: Afghanistan
    let eswatini: Burma
    let ethiopia, fiji, finland: Afghanistan
    let france: France
    let gabon, gambia, georgia: Afghanistan
    let germany: Germany
    let ghana, greece, grenada, guatemala: Afghanistan
    let guinea, guineaBissau, guyana, haiti: Afghanistan
    let holySee, honduras, hungary, iceland: Afghanistan
    let india: India
    let indonesia, iran, iraq, ireland: Afghanistan
    let israel: Afghanistan
    let italy: Italy
    let jamaica: Afghanistan
    let japan: Japan
    let jordan, kazakhstan, kenya, kiribati: Afghanistan
    let koreaNorth, koreaSouth: Afghanistan
    let kosovo: Burma
    let kuwait, kyrgyzstan, laos, latvia: Afghanistan
    let lebanon, lesotho, liberia, libya: Afghanistan
    let liechtenstein, lithuania, luxembourg: Afghanistan
    let msZaandam: Burma
    let madagascar, malawi: Afghanistan
    let malaysia: Malaysia
    let maldives, mali, malta, marshallIslands: Afghanistan
    let mauritania, mauritius: Afghanistan
    let mexico: Mexico
    let micronesia: Burma
    let moldova, monaco, mongolia: Afghanistan
    let montenegro: Burma
    let morocco, mozambique, namibia, nepal: Afghanistan
    let netherlands: Netherlands
    let newZealand: NewZealand
    let nicaragua, niger, nigeria, northMacedonia: Afghanistan
    let norway, oman: Afghanistan
    let pakistan: Pakistan
    let palau, panama, papuaNewGuinea, paraguay: Afghanistan
    let peru: Peru
    let philippines, poland, portugal, qatar: Afghanistan
    let romania: Afghanistan
    let russia: Russia
    let rwanda, saintKittsAndNevis, saintLucia, saintVincentAndTheGrenadines: Afghanistan
    let samoa, sanMarino, saoTomeAndPrincipe, saudiArabia: Afghanistan
    let senegal: Afghanistan
    let serbia: Burma
    let seychelles, sierraLeone, singapore, slovakia: Afghanistan
    let slovenia, solomonIslands, somalia, southAfrica: Afghanistan
    let southSudan: Afghanistan
    let spain: Spain
    let sriLanka, sudan: Afghanistan
    let summerOlympics2020: Burma
    let suriname: Afghanistan
    let sweden: Sweden
    let switzerland, syria: Afghanistan
    let taiwan: Burma
    let tajikistan, tanzania, thailand: Afghanistan
    let timorLeste: Burma
    let togo, tonga, trinidadAndTobago, tunisia: Afghanistan
    let turkey: Afghanistan
    let us: Us
    let uganda: Afghanistan
    let ukraine: Ukraine
    let unitedArabEmirates: Afghanistan
    let unitedKingdom: UnitedKingdom
    let uruguay, uzbekistan, vanuatu, venezuela: Afghanistan
    let vietnam: Afghanistan
    let westBankAndGaza, winterOlympics2022: Burma
    let yemen, zambia, zimbabwe: Afghanistan
    let global: Global
}

// MARK: - Afghanistan
struct Afghanistan {
    let all: AfghanistanAll
}

// MARK: - AfghanistanAll
struct AfghanistanAll {
    let confirmed, recovered, deaths: Int
    let country: String
    let population: Int?
    let sqKMArea: Double?
    let lifeExpectancy, elevationInMeters: ElevationInMeters
    let continent: Continent?
    let abbreviation: String?
    let location: String?
    let iso: Int?
    let capitalCity: String?
    let lat, long: String?
    let updated: Updated?
}

enum Continent {
    case africa
    case antarctica
    case asia
    case europe
    case northAmerica
    case oceania
    case southAmerica
}

enum ElevationInMeters {
    case integer(Int)
    case string(String)
    case null
}

enum Updated {
    case the20200804022756
    case the20201221132730
    case the20211110232144
    case the20220301232104
    case the20220609042054
}

// MARK: - Australia
struct Australia {
    let all: AfghanistanAll
    let australianCapitalTerritory, newSouthWales, northernTerritory, queensland: AustralianCapitalTerritory
    let southAustralia, tasmania, victoria, westernAustralia: AustralianCapitalTerritory
}

// MARK: - AustralianCapitalTerritory
struct AustralianCapitalTerritory {
    let lat, long: String
    let confirmed, recovered, deaths: Int
    let updated: Updated
}

// MARK: - Belgium
struct Belgium {
    let all: AfghanistanAll
    let antwerp, brussels, eastFlanders, flemishBrabant: AustralianCapitalTerritory
    let hainaut, liege, limburg, luxembourg: AustralianCapitalTerritory
    let namur, unknown, walloonBrabant, westFlanders: AustralianCapitalTerritory
}

// MARK: - Brazil
struct Brazil {
    let all: AfghanistanAll
    let acre, alagoas, amapa, amazonas: AustralianCapitalTerritory
    let bahia, ceara, distritoFederal, espiritoSanto: AustralianCapitalTerritory
    let goias, maranhao, matoGrosso, matoGrossoDoSul: AustralianCapitalTerritory
    let minasGerais, para, paraiba, parana: AustralianCapitalTerritory
    let pernambuco, piaui, rioGrandeDoNorte, rioGrandeDoSul: AustralianCapitalTerritory
    let rioDeJaneiro, rondonia, roraima, santaCatarina: AustralianCapitalTerritory
    let saoPaulo, sergipe, tocantins: AustralianCapitalTerritory
}

// MARK: - Burma
struct Burma {
    let all: AustralianCapitalTerritory
}

// MARK: - Canada
struct Canada {
    let all: AfghanistanAll
    let alberta, britishColumbia, diamondPrincess, grandPrincess: AustralianCapitalTerritory
    let manitoba, newBrunswick, newfoundlandAndLabrador, northwestTerritories: AustralianCapitalTerritory
    let novaScotia, nunavut, ontario, princeEdwardIsland: AustralianCapitalTerritory
    let quebec, repatriatedTravellers, saskatchewan, yukon: AustralianCapitalTerritory
}

// MARK: - Chile
struct Chile {
    let all: AfghanistanAll
    let antofagasta, araucania, aricaYParinacota, atacama: AustralianCapitalTerritory
    let aysen, biobio, coquimbo, losLagos: AustralianCapitalTerritory
    let losRios, magallanes, maule, metropolitana: AustralianCapitalTerritory
    let nuble, oHiggins, tarapaca, unknown: AustralianCapitalTerritory
    let valparaiso: AustralianCapitalTerritory
}

// MARK: - China
struct China {
    let all: AfghanistanAll
    let anhui, beijing, chongqing, fujian: AustralianCapitalTerritory
    let gansu, guangdong, guangxi, guizhou: AustralianCapitalTerritory
    let hainan, hebei, heilongjiang, henan: AustralianCapitalTerritory
    let hongKong, hubei, hunan, innerMongolia: AustralianCapitalTerritory
    let jiangsu, jiangxi, jilin, liaoning: AustralianCapitalTerritory
    let macau, ningxia, qinghai, shaanxi: AustralianCapitalTerritory
    let shandong, shanghai, shanxi, sichuan: AustralianCapitalTerritory
    let tianjin, tibet, unknown, xinjiang: AustralianCapitalTerritory
    let yunnan, zhejiang: AustralianCapitalTerritory
}

// MARK: - Colombia
struct Colombia {
    let all: AfghanistanAll
    let amazonas, antioquia, arauca, atlantico: AustralianCapitalTerritory
    let bolivar, boyaca, caldas, capitalDistrict: AustralianCapitalTerritory
    let caqueta, casanare, cauca, cesar: AustralianCapitalTerritory
    let choco, cordoba, cundinamarca, guainia: AustralianCapitalTerritory
    let guaviare, huila, laGuajira, magdalena: AustralianCapitalTerritory
    let meta, narino, norteDeSantander, putumayo: AustralianCapitalTerritory
    let quindio, risaralda, sanAndresYProvidencia, santander: AustralianCapitalTerritory
    let sucre, tolima, unknown, valleDelCauca: AustralianCapitalTerritory
    let vaupes, vichada: AustralianCapitalTerritory
}

// MARK: - Denmark
struct Denmark {
    let all: AfghanistanAll
    let faroeIslands, greenland: AustralianCapitalTerritory
}

// MARK: - France
struct France {
    let all: AfghanistanAll
    let frenchGuiana, frenchPolynesia, guadeloupe, martinique: AustralianCapitalTerritory
    let mayotte, newCaledonia, reunion, saintBarthelemy: AustralianCapitalTerritory
    let saintPierreAndMiquelon, stMartin, wallisAndFutuna: AustralianCapitalTerritory
}

// MARK: - Germany
struct Germany {
    let all: AfghanistanAll
    let badenWurttemberg, bayern, berlin, brandenburg: AustralianCapitalTerritory
    let bremen, hamburg, hessen, mecklenburgVorpommern: AustralianCapitalTerritory
    let niedersachsen, nordrheinWestfalen, rheinlandPfalz, saarland: AustralianCapitalTerritory
    let sachsen, sachsenAnhalt, schleswigHolstein, thuringen: AustralianCapitalTerritory
    let unknown: AustralianCapitalTerritory
}

// MARK: - Global
struct Global {
    let all: GlobalAll
}

// MARK: - GlobalAll
struct GlobalAll {
    let population, confirmed, recovered, deaths: Int
}

// MARK: - India
struct India {
    let all: AfghanistanAll
    let andamanAndNicobarIslands, andhraPradesh, arunachalPradesh, assam: AustralianCapitalTerritory
    let bihar, chandigarh, chhattisgarh, dadraAndNagarHaveliAndDamanAndDiu: AustralianCapitalTerritory
    let delhi, goa, gujarat, haryana: AustralianCapitalTerritory
    let himachalPradesh, jammuAndKashmir, jharkhand, karnataka: AustralianCapitalTerritory
    let kerala, ladakh, lakshadweep, madhyaPradesh: AustralianCapitalTerritory
    let maharashtra, manipur, meghalaya, mizoram: AustralianCapitalTerritory
    let nagaland, odisha, puducherry, punjab: AustralianCapitalTerritory
    let rajasthan, sikkim, tamilNadu, telangana: AustralianCapitalTerritory
    let tripura, unknown, uttarPradesh, uttarakhand: AustralianCapitalTerritory
    let westBengal: AustralianCapitalTerritory
}

// MARK: - Italy
struct Italy {
    let all: AfghanistanAll
    let abruzzo, basilicata, calabria, campania: AustralianCapitalTerritory
    let emiliaRomagna, friuliVeneziaGiulia, lazio, liguria: AustralianCapitalTerritory
    let lombardia, marche, molise, pABolzano: AustralianCapitalTerritory
    let pATrento, piemonte, puglia, sardegna: AustralianCapitalTerritory
    let sicilia, toscana, umbria, valleDAosta: AustralianCapitalTerritory
    let veneto: AustralianCapitalTerritory
}

// MARK: - Japan
struct Japan {
    let all: AfghanistanAll
    let aichi, akita, aomori, chiba: AustralianCapitalTerritory
    let ehime, fukui, fukuoka, fukushima: AustralianCapitalTerritory
    let gifu, gunma, hiroshima, hokkaido: AustralianCapitalTerritory
    let hyogo, ibaraki, ishikawa, iwate: AustralianCapitalTerritory
    let kagawa, kagoshima, kanagawa, kochi: AustralianCapitalTerritory
    let kumamoto, kyoto, mie, miyagi: AustralianCapitalTerritory
    let miyazaki, nagano, nagasaki, nara: AustralianCapitalTerritory
    let niigata, oita, okayama, okinawa: AustralianCapitalTerritory
    let osaka, portQuarantine, saga, saitama: AustralianCapitalTerritory
    let shiga, shimane, shizuoka, tochigi: AustralianCapitalTerritory
    let tokushima, tokyo, tottori, toyama: AustralianCapitalTerritory
    let unknown, wakayama, yamagata, yamaguchi: AustralianCapitalTerritory
    let yamanashi: AustralianCapitalTerritory
}

// MARK: - Malaysia
struct Malaysia {
    let all: AfghanistanAll
    let johor, kedah, kelantan, melaka: AustralianCapitalTerritory
    let negeriSembilan, pahang, perak, perlis: AustralianCapitalTerritory
    let pulauPinang, sabah, sarawak, selangor: AustralianCapitalTerritory
    let terengganu, unknown, wPKualaLumpur, wPLabuan: AustralianCapitalTerritory
    let wPPutrajaya: AustralianCapitalTerritory
}

// MARK: - Mexico
struct Mexico {
    let all: AfghanistanAll
    let aguascalientes, bajaCalifornia, bajaCaliforniaSur, campeche: AustralianCapitalTerritory
    let chiapas, chihuahua, ciudadDeMexico, coahuila: AustralianCapitalTerritory
    let colima, durango, guanajuato, guerrero: AustralianCapitalTerritory
    let hidalgo, jalisco, mexico, michoacan: AustralianCapitalTerritory
    let morelos, nayarit, nuevoLeon, oaxaca: AustralianCapitalTerritory
    let puebla, queretaro, quintanaRoo, sanLuisPotosi: AustralianCapitalTerritory
    let sinaloa, sonora, tabasco, tamaulipas: AustralianCapitalTerritory
    let tlaxcala, unknown, veracruz, yucatan: AustralianCapitalTerritory
    let zacatecas: AustralianCapitalTerritory
}

// MARK: - Netherlands
struct Netherlands {
    let all: AfghanistanAll
    let aruba, bonaireSintEustatiusAndSaba, curacao, drenthe: AustralianCapitalTerritory
    let flevoland, friesland, gelderland, groningen: AustralianCapitalTerritory
    let limburg, noordBrabant, noordHolland, overijssel: AustralianCapitalTerritory
    let sintMaarten, unknown, utrecht, zeeland: AustralianCapitalTerritory
    let zuidHolland: AustralianCapitalTerritory
}

// MARK: - NewZealand
struct NewZealand {
    let all: AfghanistanAll
    let cookIslands: AustralianCapitalTerritory
}

// MARK: - Pakistan
struct Pakistan {
    let all: AfghanistanAll
    let azadJammuAndKashmir, balochistan, gilgitBaltistan, islamabad: AustralianCapitalTerritory
    let khyberPakhtunkhwa, punjab, sindh: AustralianCapitalTerritory
}

// MARK: - Peru
struct Peru {
    let all: AfghanistanAll
    let amazonas, ancash, apurimac, arequipa: AustralianCapitalTerritory
    let ayacucho, cajamarca, callao, cusco: AustralianCapitalTerritory
    let huancavelica, huanuco, ica, junin: AustralianCapitalTerritory
    let laLibertad, lambayeque, lima, loreto: AustralianCapitalTerritory
    let madreDeDios, moquegua, pasco, piura: AustralianCapitalTerritory
    let puno, sanMartin, tacna, tumbes: AustralianCapitalTerritory
    let ucayali, unknown: AustralianCapitalTerritory
}

// MARK: - Russia
struct Russia {
    let all: AfghanistanAll
    let adygeaRepublic, altaiKrai, altaiRepublic, amurOblast: AustralianCapitalTerritory
    let arkhangelskOblast, astrakhanOblast, bashkortostanRepublic, belgorodOblast: AustralianCapitalTerritory
    let bryanskOblast, buryatiaRepublic, chechenRepublic, chelyabinskOblast: AustralianCapitalTerritory
    let chukotkaAutonomousOkrug, chuvashiaRepublic, dagestanRepublic, ingushetiaRepublic: AustralianCapitalTerritory
    let irkutskOblast, ivanovoOblast, jewishAutonomousOkrug, kabardinoBalkarianRepublic: AustralianCapitalTerritory
    let kaliningradOblast, kalmykiaRepublic, kalugaOblast, kamchatkaKrai: AustralianCapitalTerritory
    let karachayCherkessRepublic, kareliaRepublic, kemerovoOblast, khabarovskKrai: AustralianCapitalTerritory
    let khakassiaRepublic, khantyMansiAutonomousOkrug, kirovOblast, komiRepublic: AustralianCapitalTerritory
    let kostromaOblast, krasnodarKrai, krasnoyarskKrai, kurganOblast: AustralianCapitalTerritory
    let kurskOblast, leningradOblast, lipetskOblast, magadanOblast: AustralianCapitalTerritory
    let mariElRepublic, mordoviaRepublic, moscow, moscowOblast: AustralianCapitalTerritory
    let murmanskOblast, nenetsAutonomousOkrug, nizhnyNovgorodOblast, northOssetiaAlaniaRepublic: AustralianCapitalTerritory
    let novgorodOblast, novosibirskOblast, omskOblast, orelOblast: AustralianCapitalTerritory
    let orenburgOblast, penzaOblast, permKrai, primorskyKrai: AustralianCapitalTerritory
    let pskovOblast, rostovOblast, ryazanOblast, saintPetersburg: AustralianCapitalTerritory
    let sakhaYakutiyaRepublic, sakhalinOblast, samaraOblast, saratovOblast: AustralianCapitalTerritory
    let smolenskOblast, stavropolKrai, sverdlovskOblast, tambovOblast: AustralianCapitalTerritory
    let tatarstanRepublic, tomskOblast, tulaOblast, tverOblast: AustralianCapitalTerritory
    let tyumenOblast, tyvaRepublic, udmurtRepublic, ulyanovskOblast: AustralianCapitalTerritory
    let vladimirOblast, volgogradOblast, vologdaOblast, voronezhOblast: AustralianCapitalTerritory
    let yamaloNenetsAutonomousOkrug, yaroslavlOblast, zabaykalskyKrai: AustralianCapitalTerritory
}

// MARK: - Spain
struct Spain {
    let all: AfghanistanAll
    let andalusia, aragon, asturias, baleares: AustralianCapitalTerritory
    let cValenciana, canarias, cantabria, castillaLaMancha: AustralianCapitalTerritory
    let castillaYLeon, catalonia, ceuta, extremadura: AustralianCapitalTerritory
    let galicia, laRioja, madrid, melilla: AustralianCapitalTerritory
    let murcia, navarra, paisVasco, unknown: AustralianCapitalTerritory
}

// MARK: - Sweden
struct Sweden {
    let all: AfghanistanAll
    let blekinge, dalarna, gavleborg, gotland: AustralianCapitalTerritory
    let halland, jamtlandHarjedalen, jonkoping, kalmar: AustralianCapitalTerritory
    let kronoberg, norrbotten, orebro, ostergotland: AustralianCapitalTerritory
    let skane, sormland, stockholm, uppsala: AustralianCapitalTerritory
    let varmland, vasterbotten, vasternorrland, vastmanland: AustralianCapitalTerritory
    let vastraGotaland: AustralianCapitalTerritory
}

// MARK: - Ukraine
struct Ukraine {
    let all: AfghanistanAll
    let cherkasyOblast, chernihivOblast, chernivtsiOblast, crimeaRepublic: AustralianCapitalTerritory
    let dnipropetrovskOblast, donetskOblast, ivanoFrankivskOblast, kharkivOblast: AustralianCapitalTerritory
    let khersonOblast, khmelnytskyiOblast, kiev, kievOblast: AustralianCapitalTerritory
    let kirovohradOblast, luhanskOblast, lvivOblast, mykolaivOblast: AustralianCapitalTerritory
    let odessaOblast, poltavaOblast, rivneOblast, sevastopol: AustralianCapitalTerritory
    let sumyOblast, ternopilOblast, vinnytsiaOblast, volynOblast: AustralianCapitalTerritory
    let zakarpattiaOblast, zaporizhiaOblast, zhytomyrOblast: AustralianCapitalTerritory
}

// MARK: - UnitedKingdom
struct UnitedKingdom {
    let all: AfghanistanAll
    let anguilla, bermuda, britishVirginIslands, caymanIslands: AustralianCapitalTerritory
    let channelIslands, england, falklandIslandsMalvinas, gibraltar: AustralianCapitalTerritory
    let guernsey, isleOfMan, jersey, montserrat: AustralianCapitalTerritory
    let northernIreland, saintHelenaAscensionAndTristanDaCunha, scotland, turksAndCaicosIslands: AustralianCapitalTerritory
    let unknown, wales: AustralianCapitalTerritory
}

// MARK: - Us
struct Us {
    let all: AfghanistanAll
    let alabama, alaska, americanSamoa, arizona: AustralianCapitalTerritory
    let arkansas, california, colorado, connecticut: AustralianCapitalTerritory
    let delaware, diamondPrincess, districtOfColumbia, florida: AustralianCapitalTerritory
    let georgia, grandPrincess, guam, hawaii: AustralianCapitalTerritory
    let idaho, illinois, indiana, iowa: AustralianCapitalTerritory
    let kansas, kentucky, louisiana, maine: AustralianCapitalTerritory
    let maryland, massachusetts, michigan, minnesota: AustralianCapitalTerritory
    let mississippi, missouri, montana, nebraska: AustralianCapitalTerritory
    let nevada, newHampshire, newJersey, newMexico: AustralianCapitalTerritory
    let newYork, northCarolina, northDakota, northernMarianaIslands: AustralianCapitalTerritory
    let ohio, oklahoma, oregon, pennsylvania: AustralianCapitalTerritory
    let puertoRico, recovered, rhodeIsland, southCarolina: AustralianCapitalTerritory
    let southDakota, tennessee, texas, utah: AustralianCapitalTerritory
    let vermont, virginIslands, virginia, washington: AustralianCapitalTerritory
    let westVirginia, wisconsin, wyoming: AustralianCapitalTerritory
}

data Auto = Auto {nombre :: String, nivelNafta :: Int, velocidad :: Int , nombreEnamorade :: String, truco :: String} deriving (Show)

deReversa :: Auto -> Auto
deReversa unAuto = unAuto {nivelNafta = ((+200).nivelNafta) unAuto}

impresionar :: Auto -> Auto
impresionar unAuto = unAuto {velocidad = ((*2).velocidad) unAuto}

nitro :: Auto -> Auto
nitro unAuto = unAuto {velocidad = ((+15).velocidad) unAuto}

fingirAmor :: Auto -> String -> Auto
fingirAmor unAuto enamoradeConveniencia = unAuto {nombreEnamorade = enamoradeConveniencia}

rochaMcQueen = Auto "RochaMcQueen" 300 0 "Ronco" "deReversa"
biankerr = Auto "Biankerr" 500 20 "Tinch" "impresionar" 
gusthav = Auto "Gusthav" 200 130 "PetiLaLinda" "nitro"
rodra = Auto "Rodra" 0 50 "Taisa" "fingirAmor"

vocales :: String -> String
vocales palabra = filter(=='a') palabra ++ filter (=='e') palabra ++ filter(=='i') palabra ++ filter(=='o') palabra ++ filter(=='u') palabra

cantidadVocales :: Auto -> Int
cantidadVocales unAuto = (length.vocales.nombreEnamorade) unAuto

incrementarVelocidad :: Auto -> Auto
incrementarVelocidad unAuto
    |(cantidadVocales unAuto >= 1 && cantidadVocales unAuto <=2) = unAuto {velocidad=((+15).velocidad) unAuto}
    |(cantidadVocales unAuto >= 3 && cantidadVocales unAuto <=4) = unAuto {velocidad=((+20).velocidad) unAuto}
    |cantidadVocales unAuto >= 4 = unAuto {velocidad=((+30).velocidad) unAuto}

puedeRealizarTruco :: Auto -> Bool
puedeRealizarTruco unAuto = ((>0).nivelNafta) unAuto && ((<100).velocidad) unAuto

comboLoco :: Auto -> Auto
comboLoco = deReversa.nitro 

queTrucazo :: Auto -> String -> Auto
queTrucazo unAuto enamoradeConveniencia = unAuto {velocidad = (velocidad.incrementarVelocidad) (fingirAmor unAuto enamoradeConveniencia)}

turbo :: Auto -> Auto 
turbo unAuto = unAuto {velocidad = ((+velocidad unAuto).(*10).nivelNafta) unAuto , nivelNafta = 0}
= Anexos
== Datos das Mostras

#set par(justify: false)
#show table.cell.where(y: 0): set text(size: 0.9em, weight: "bold")

#figure(
    caption: [
        Información das diferentes mostras usadas nesta práctica de laboratorio
    ],
    table(
        columns : (1fr, 1fr, 1fr, 1fr, 1fr),
        stroke  : none,
        table.hline(),
        table.header([Fonte] , [Referencia] , [Actividade na fabricación [Bq]] , [Data de Fabricación] , [$T_(1\/2)$]) ,
        table.hline(stroke: 0.6pt),
        [Cs 137] , [FG-A]                  , [350390]          , [11/4/83]             , [$3.02 dot 10^1$ anos] ,
        [Cs 137] , [1907.GV Nucl. Iberic.] , [306730000]       , [7/8/01]              , [$3.02 dot 10^1$ anos] ,
        [Na 22]  , [09047-52]              , [74000]           , [20/1/20]             , [$9.5 dot 10^2$ días]  ,
        [Co 60]  , [KA743]                 , [399000]          , [1/9/01]              , [$1.93 dot 10^3$ días] ,
        [Eu 153] , [MCR2007-07]            , [38973]           , [1/2/07]              , [$1.35 dot 10^1$ anos] ,
        table.hline()

    )
) <tab:datos-mostras>

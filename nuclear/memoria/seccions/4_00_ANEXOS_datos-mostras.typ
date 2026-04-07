= Anexos
== Datos das Mostras

#set par(justify: false)
#show table.cell: set text(size: 0.9em)
#show table.cell.where(y: 0): set text(size: 0.9em, weight: "bold")

#figure(
    caption: [
        Información das diferentes mostras usadas nesta práctica de
        laboratorio. As actividades actuais calculáronse ca fórmula
        @ec:actividade e súas incertezas están xustificada na sección
        @sec:tratamento
    ],
    table(
        columns       : (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        column-gutter : 0pt,
        stroke        : none,
        table.hline(),
        table.header(
            [Fonte],
            [Referencia],
            [Data de Fabricación],
            [Actividade na fabricación [Bq]],
            [Actividade actual\ [Bq]],
            [$T_(1\/2)$],
        ) ,
        table.hline(stroke: 0.6pt),
        [Cs 137] , [FG-A]                  , [11/4/83] , [350390]    , [130925(1)]    , [$3.02 dot 10^1$ anos] ,
        [Cs 137] , [1907.GV Nucl. Iberic.] , [7/8/01]  , [306730000] , [174586495(1)] , [$3.02 dot 10^1$ anos] ,
        [Na 22]  , [09047-52]              , [20/1/20] , [74000]     , [14626(1)]     , [$9.5 dot 10^2$ días]  ,
        [Co 60]  , [KA743]                 , [1/9/01]  , [399000]    , [16107(1)]     , [$1.93 dot 10^3$ días] ,
        [Eu 153] , [MCR2007-07]            , [1/2/07]  , [38973]     , [14644(1)]     , [$1.35 dot 10^1$ anos] ,
        table.hline()

    )
) <tab:datos-mostras>

// Esto son dicionarios que se poden acceder noutras partes do código pa ter a info das fontes
#let _norm = ( familia: "Cochineal"              , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _mate = ( familia: "Libertinus Math"        , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _sans = ( familia: "Roboto"                 , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _cond = ( familia: "Roboto"                 , peso: 400 , estilo: "normal" , estiramento: 75%  )
#let _slab = ( familia: "Roboto Slab"            , peso: 200 , estilo: "normal" , estiramento: 100% )
#let _mono = ( familia: "FiraCode Nerd Font"     , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _simb = ( familia: "Symbols Nerd Font Mono" , peso: 400 , estilo: "normal" , estiramento: 100% )

// Varias funcións para activar as distintas fontes directamente
#let normal     = eso => text( fallback: false, font: _norm.familia, weight: _norm.peso, style: _norm.estilo, stretch: _norm.estiramento,)[#eso]
#let mates      = eso => text( fallback: false, font: _mate.familia, weight: _mate.peso, style: _mate.estilo, stretch: _mate.estiramento,)[#eso]
#let sans       = eso => text( fallback: false, font: _sans.familia, weight: _sans.peso, style: _sans.estilo, stretch: _sans.estiramento,)[#eso]
#let condensada = eso => text( fallback: false, font: _cond.familia, weight: _cond.peso, style: _cond.estilo, stretch: _cond.estiramento,)[#eso]
#let slab       = eso => text( fallback: false, font: _slab.familia, weight: _slab.peso, style: _slab.estilo, stretch: _slab.estiramento,)[#eso]
#let mono       = eso => text( fallback: false, font: _mono.familia, weight: _mono.peso, style: _mono.estilo, stretch: _mono.estiramento,)[#eso]
#let simbolos   = eso => text( fallback: false, font: _simb.familia, weight: _simb.peso, style: _simb.estilo, stretch: _simb.estiramento,)[#eso]

/// Funcion para crear a portada
#let crear_portada(grupo,correo,github) = {
    set align(center)
    grid(
        columns : 1fr,
        rows    : (1fr,1fr,1fr),
        align   : horizon,

        grid.cell( x:0,y:0, (slab(title())) ),

        grid.cell(
            x:0,y:1,
            {
                text(size: 1.5em, smallcaps( context { document.author.join("\n") } ))
                v(1em)
                mono(correo)
            }
        ),

        grid.cell(
            x:0, y:2,
            {
                set align(bottom)
                text(size:1.3em,simbolos[])
                h(1em)
                link("https://github.com/" + github, github)
                h(1fr)
                mono(datetime.today().display())
            }
        )

    )
}

/// Funcion para crear o Índice de materias
#let crear_indice_contidos() = {
    heading(
        level      : 1,
        numbering  : none,
        outlined   : false,
        bookmarked : true,
        condensada[Índice de contidos],
    )
    outline(
        title : none,
        depth : 4
    )
}

/// Funcion para crear a Bibliografía
#let crear_bibliografia() = {
    v(1fr)
}


/// Funcion para crear a contraportada
#let crear_contraportada() = {
    v(1fr)
}


/// ESTILO xeral, que aplica a TODO
#let estilo_xeral(
    titulo  : none,
    autoria : (),
    doc,
) = {
    set document(
        title  : titulo,
        author : autoria.map(autor => autor.nome),
        date   : datetime.today()
    )
    set page(
        paper   : "a4",
        binding : left,
    )
    set text(
        size      : 12pt,
        font      : _norm.familia,
        weight    : _norm.peso,
        style     : _norm.estilo,
        stretch   : _norm.estiramento,
        fallback  : false,
        features  : (
            liga : 1,
            kern : 1,
            cc03 : 4
        ),
        overhang  : true,
        costs     : (
            hyphenation : 100%,
            runt        : 100%,
            widow       : 100%,
            orphan      : 100%,
        ),
        lang      : "gl",
        region    : "ES",
        script    : "latn",
        dir       : ltr,
        hyphenate : true,
    )
    set par(
        justify              : true,
        justification-limits : (
            tracking : (min: -0.04em, max: 0.02em),
            spacing  : (min: 66.67% + 0pt, max: 150% + 0pt),
        ),
        first-line-indent    : 1.5em,
        spacing              : 0.65em,
        leading              : 0.60em,
        linebreaks           : "optimized"
    )
    show raw: set text(
        font    : _mono.familia,
        weight  : _mono.peso,
        style   : _mono.estilo,
        stretch : _mono.estiramento
    )
    show math.equation: set text(
        font    : _mate.familia,
        weight  : _mate.peso,
        style   : _mate.estilo,
        stretch : _mate.estiramento
    )
    show heading: eso => condensada([*#eso*])
    doc
}

/// ESTILO da portada, fondos, cor por defecto, etc. Non ten contido, só estilo
#let estilo_portada(doc) = {
    set align(center)
    set page(
        header     : none,
        footer     : none,
        numbering  : none,
        margin     : (top: 3cm, inside: 3cm, outside: 3cm, bottom: 3cm),
        background : {
            rect(height: 92%, width: 90%, stroke: 0.6pt )
        },
    )
    show link: set text(font: _mono.familia)
    doc
}

// ESTILO do frontmatter. Agradecementos, índice de contido, prólogo, etc.
#let estilo_frontmatter(doc) = {
    show outline.entry.where( level: 1 ): set block(above: 1.5em, below: 1em)
    show outline.entry.where( level: 1 ): set text(
        font    : _cond.familia,
        weight  : _cond.peso + 250,
        stretch : _cond.estiramento,
        size    : 1.4em,
    )
    show outline.entry.where( level: 1 ): set outline.entry(fill: none)
    show heading.where(level: 1): set block(below: 1em)
    doc
}

/// ESTILO do corpo. O propio documento con matemáticas e física
#let estilo_mainmatter(doc) = {
    set page(
        numbering      : "1",
        // header         : crear_encabezado(),
        // footer         : crear_pe(),
        header         : line(length:100%, stroke: 0.6pt),
        footer         : context {
            grid(
                columns:3,rows:1,
                align: (left + horizon, center + horizon, right + horizon),
                line(length:90%, stroke: 0.6pt),
                str(counter(page).get().first()),
                line(length:90%, stroke: 0.6pt),
            )
        },
        header-ascent  : 10%,
        footer-descent : 10%,
        background     : none,
        margin         : (
            top     : 2cm,
            inside  : 2cm,
            outside : 2cm,
            bottom  : 2cm
        ),
    )
    // As ecuacions no texto deben ser 'box' para que non se rompan
    show math.equation.where(block: false): eso => { box(eso) }
    show quote: set text(style:"italic")
    show figure.caption: set text(font: _sans.familia)
    show figure.caption: eso => {
        strong[#eso.supplement~#eso.counter.display() #eso.separator]
        eso.body
    }
    set math.equation(
        numbering: eso => {
            let HEA = counter(heading.where(level:1)).at(here()).last()
            let SEC = counter(heading.where(level:2)).at(here()).last()
            [(#HEA.#SEC.#eso)]
        }
    )
    doc
}

#let estilo_backmatter(doc) = {
    v(1em)
    doc
}

/// ESTILO da contraportada, idéntico á portada
#let estilo_contraportada(doc) = {
    v(1em)
}

//   ____ ____  _____    _    ____    __  __ _____ __  __  ___  ____  ___    _
//  / ___|  _ \| ____|  / \  |  _ \  |  \/  | ____|  \/  |/ _ \|  _ \|_ _|  / \
// | |   | |_) |  _|   / _ \ | |_) | | |\/| |  _| | |\/| | | | | |_) || |  / _ \
// | |___|  _ <| |___ / ___ \|  _ <  | |  | | |___| |  | | |_| |  _ < | | / ___ \
//  \____|_| \_\_____/_/   \_\_| \_\ |_|  |_|_____|_|  |_|\___/|_| \_\___/_/   \_\
#let crear_memoria(
    autoria            : (),
    titulo             : none,
    portada            : true,
    grupo              : none,
    github             : none,
    correo             : none,
    indice_contidos    : true,
    bibliografia       : true,
    contraportada      : true,
    documento          : none
) = {

    // ESTILO XERAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Estilo xeral que afecta a TODO o documento. Cousas como a tipografía
    // básica, kerning, dirección do texto, idioma, etc
    show: estilo_xeral.with(
        autoria : autoria,
        titulo  : titulo
    )

    //// PORTADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    {

        if portada {
            show: estilo_portada
            crear_portada(grupo, correo, github)
            pagebreak()
        }

    }

    // FRONTMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Cousas como o índice, agradecementos, dereitos, copyright, etc.
    {
        show: estilo_frontmatter

        // Mostramos o índice
        if indice_contidos {
            crear_indice_contidos()
        }

    }

    //  MAINMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // O corpo do documento. Capítulos e tal.
    {
        show: estilo_mainmatter

        //// Devolvemos o contido do documento
        documento
    }

    // BACKMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Fin do documento, apéndices, índice alfabético, biblio, etc.
    {
        show: estilo_backmatter

        // Mostramos a bibliografía
        if bibliografia {
            pagebreak()
            crear_bibliografia()
        }

    }

    //// CONTRAPORTADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Simplemente a contraportada
    {

        if contraportada {
            show: estilo_contraportada
            crear_contraportada()
        }

    }

}

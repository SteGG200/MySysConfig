#let conf(
	title: none,
	doc
) = {
	set page(paper: "a4")
	set text(font: "New Computer Modern Math")
	set heading(numbering: "I.1.a.")
	set list(marker: ("‣", "-", [\u{fe62}]))

	set math.mat(delim: "[")

	if title != none {
		set align(center)
		text(size: 20pt, weight: "bold")[#title]
	}

	set align(left)
	set text(size: 12pt)
	
	doc
}

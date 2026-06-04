# A Note on JOIN Multiplicity in SPARQL Conjunctive Queries

A short, self-contained proof that, under SPARQL bag-set semantics, the `JOIN`
operator cannot create duplicate results inside a conjunctive query.

## Introduction / Context

SPARQL is evaluated under **bag-set semantics**: an RDF knowledge graph (KG) is a
*set* of triples, while SPARQL operators return **bags** (multisets) of solution
mappings. A **conjunctive query (CQ)** is a query whose body is a single basic
graph pattern (BGP), optionally followed by a projection; its only body operator
is `JOIN`.

This repository proves that, in a CQ, `JOIN` cannot raise the multiplicity of a
solution mapping above one. Within a CQ, projection at the head is therefore the
only operator that can introduce duplicates. The argument is SPARQL-specific: it
works directly from the SPARQL specification's definition of `JOIN` multiplicity
over solution mappings, and gives the SPARQL counterpart of the relational result
of Chaudhuri and Vardi and of Afrati et al. that, for conjunctive queries, only
projection increases multiplicity.

## The statement

> **Proposition.** In a CQ, `JOIN` cannot produce a solution mapping with
> multiplicity higher than one.

The proof (see [`main.tex`](main.tex)) rules out the two ways the SPARQL `JOIN`
multiplicity rule could exceed one: (i) a single result arising from more than
one pair of compatible inputs, and (ii) an input mapping that already has
multiplicity above one. Both are impossible in a CQ because every intermediate
bag binds a fixed set of variables and the base multiplicities come from a
set-semantic KG.

## Build

```sh
make          # build main.pdf
make watch    # rebuild on change (latexmk -pvc)
make clean    # remove build artifacts
```

Requires a TeX distribution with `latexmk`. The latest compiled PDF is also
attached to the most recent [GitHub Release](../../releases/latest).

## License

Licensed under the
[Creative Commons Attribution 4.0 International License (CC BY 4.0)](LICENSE).

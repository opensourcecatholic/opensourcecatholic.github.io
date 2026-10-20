---
layout: post
title: "Turn a CSV service plan into an offline handoff sheet"
date: 2026-10-20 00:00:00 +0000
categories: [tutorials, parish-technology]
author: szj2ys
comments: true
---

A service plan is more useful when the people carrying it out can read the same version. A parish technology volunteer can make a small printed handoff sheet from a spreadsheet without setting up another account or website. The example below uses Python's standard library to turn four CSV columns into a local HTML file. Open that file in a browser, review it with the team, and print it.

The sheet records who leads each segment, what language support has been agreed, and what to do if the plan changes. It does not translate speech, confirm someone's availability, or decide liturgical practice. Those remain conversations with the people responsible for the service.

## Start with a small, fictional plan

Create a folder for the example. Save the following as `plan.csv`, using UTF-8 text. These three rows are fictional planning examples, not a report of parish use. Replace them with your team's agreed arrangements before using the output.

On a narrow screen, scroll sideways inside a code block to read long lines. Copy the complete block when saving a file.

```csv
segment,lead,language_support,fallback
Arrival,Welcome volunteer,Ask each visitor which language would help,Use the agreed printed welcome sheet if the display is unavailable
Announcements,Service leader,Allow the agreed interpreter to finish before the next item,Pause and agree the next step if the interpreter is absent
After the service,Welcome volunteer,Offer the planned conversation with the language-support volunteer,Explain honestly which support is available today
```

You can also prepare the four columns in a spreadsheet and export **CSV UTF-8**, with commas as separators. Keep the header names and their order exactly as shown. A cell containing a comma must be quoted in the CSV; a spreadsheet exporter normally handles that for you. This script deliberately rejects other layouts instead of guessing how they map to the sheet.

Use role names where they are sufficient. A handoff for volunteers does not need an attendee list or private pastoral information. The example has no names, contact details, or accounts.

## Create the converter

Save this complete program in the same folder as `print_plan.py`. It uses a local Python 3 installation and has no packages to install. The program reads the CSV, checks its shape, then writes a new file. It refuses to overwrite an existing output file.

```python
"""Create an offline handoff sheet from a four-column UTF-8 CSV file."""
import argparse
import csv
from html import escape
from pathlib import Path

COLUMNS = ["segment", "lead", "language_support", "fallback"]
STYLE = """
* { box-sizing: border-box; }
body { max-width: 48rem; margin: 0 auto; padding: 1.25rem;
       color: #111; background: white; font: 18px/1.5 Arial, sans-serif; }
h1 { font-size: 1.6rem; line-height: 1.2; }
h2 { margin: 0 0 .7rem; font-size: 1.15rem; }
section { border: 1px solid #555; padding: 1rem; margin: 1rem 0; }
dt { font-weight: bold; margin-top: .5rem; }
dd { margin: 0; }
h1, h2, dd { overflow-wrap: anywhere; }
@page { margin: 15mm; }
@media print {
  body { max-width: none; padding: 0; font-size: 12pt; }
  section { break-inside: avoid; }
}
"""


def read_plan(source):
    with source.open(encoding="utf-8-sig", newline="") as handle:
        reader = csv.DictReader(handle, strict=True)
        if reader.fieldnames != COLUMNS:
            raise ValueError("Header must be: " + ",".join(COLUMNS))
        rows = []
        for row in reader:
            if None in row or any(value is None for value in row.values()):
                raise ValueError(f"CSV line {reader.line_num}: expected four cells")
            row = {key: value.strip() for key, value in row.items()}
            if any(not value for value in row.values()):
                raise ValueError(f"CSV line {reader.line_num}: fill every cell")
            rows.append(row)
    if not rows:
        raise ValueError("Add at least one plan row below the header")
    return rows


def render(rows):
    cards = []
    for number, row in enumerate(rows, 1):
        details = "".join(
            f'<dt>{label}</dt><dd dir="auto">{escape(row[key])}</dd>'
            for key, label in [
                ("lead", "Lead role"),
                ("language_support", "Language support"),
                ("fallback", "If the plan changes"),
            ]
        )
        cards.append(
            f'<section><h2>{number}. <bdi>{escape(row["segment"])}</bdi></h2>'
            f"<dl>{details}</dl></section>"
        )
    return (
        '<!doctype html><html lang="en"><meta charset="utf-8">'
        '<meta name="viewport" content="width=device-width,initial-scale=1">'
        f"<title>Service team handoff</title><style>{STYLE}</style>"
        "<body><main><h1>Service team handoff</h1>"
        "<p>Review this draft with the people named by role. "
        "It records a plan; it does not provide interpretation.</p>"
        + "".join(cards) + "</main></body></html>"
    )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("csv_file", type=Path)
    parser.add_argument("html_file", type=Path)
    args = parser.parse_args()
    try:
        if args.csv_file.resolve() == args.html_file.resolve():
            raise ValueError("Choose an output file different from the input CSV")
        html = render(read_plan(args.csv_file))
        with args.html_file.open("x", encoding="utf-8") as handle:
            handle.write(html)
    except (OSError, UnicodeError, csv.Error, ValueError) as error:
        parser.exit(1, f"Cannot create handoff: {error}\n")
    print(f"Created {args.html_file}; open it in a browser and review before printing.")


if __name__ == "__main__":
    main()
```

The [CSV reader](https://docs.python.org/3/library/csv.html) handles quoted commas and line endings. `utf-8-sig` accepts UTF-8 files with or without a byte-order mark. An exact header check also catches repeated column names, which could otherwise hide a value when rows become dictionaries.

Every cell passes through [`html.escape`](https://docs.python.org/3/library/html.html#html.escape) before entering the document. A note containing `<script>` or an ampersand stays text. It is not treated as markup. The generated sheet has no scripts, remote fonts, images, or network requests.

The output uses one block per segment rather than a wide table. Long text can wrap on a narrow screen. The print stylesheet asks the browser to keep each block together using [`break-inside`](https://developer.mozilla.org/en-US/docs/Web/CSS/break-inside). A block longer than a page still needs editing or an intentional page break; CSS cannot make unlimited text fit on one sheet.

## Generate and inspect the sheet

Open a terminal in the folder containing both files. On Windows, with the Python launcher installed, run:

```text
py -3 print_plan.py plan.csv handoff.html
```

On macOS or Linux, use the command for your installed Python 3 interpreter, commonly:

```text
python3 print_plan.py plan.csv handoff.html
```

If your system exposes Python 3 as `python`, that command works too. A successful run prints the created filename. If it reports a header or cell error, correct the CSV and run it again. If `handoff.html` already exists, choose a new output name such as `handoff-v2.html`; the program will not silently replace an earlier version.

Open the resulting HTML file in your browser. Check all three segment headings and the lead, language-support and fallback text beneath each one. Then reload with the network disconnected. The file should remain readable because its content and styling are local. Nothing is sent to a server by this program.

Use the browser's **Print** command and inspect the preview before printing. Choose the paper size used by your printer. Check for clipped lines, unexpected blank pages and any segment separated from its details. Browser headers and footers are optional print settings, not content supplied by the program. Save a PDF first if you want to inspect the output without consuming paper.

## Rehearse the handoff, not just the file

Ask the people represented by the role names to read the sheet together. For the fictional announcements row, decide what “pause and agree the next step” means locally and who can make that decision. If no interpreter is available, the sheet should say what support can actually be offered. A written summary or a friendly welcome does not automatically replace interpretation.

Confirm the plan with the service leader and the people providing language support. A technical volunteer can format the plan; this program does not validate translation quality, approve a liturgical change, or establish accessibility compliance. Put a version/date in a segment note if your team needs it, and agree how outdated paper copies will be replaced.

Before relying on your edited file, try one recoverable mistake: leave a fallback cell empty. The converter should stop with an error rather than produce an incomplete new sheet. Restore the text and generate a new output filename. Also check any accented or non-Latin text your team uses in both the browser and print preview; the available fonts and printer can affect the result.

This is a small, inspectable tool for producing a shared draft. Its useful outcome is a plan the team has reviewed and can carry offline. It makes no claim that a congregation has tested the example or that printing it improves a measured ministry outcome.

<!-- PUBLISHER-START -->
For a broader welcome-team planning discussion, see [Welcoming Multilingual Visitors to Your Church](https://pewtranslate.com/guides/welcoming-multilingual-visitors/), published by the contributor's PewTranslate project. That is an optional article reference. PewTranslate's application, sign-up, live translation and payments are unavailable; this tutorial does not use or require them.
<!-- PUBLISHER-END -->

*Prepared with AI assistance for editorial review. The example and code are original; no parish use, Catholic affiliation, interpreting qualification or clergy role is claimed. This contribution is offered under this repository's MIT license.*

#!/bin/bash
find ./ -name "[、-鶴]*.pdf" -type f -printf "%f\t\t" -exec sh -c "pdfinfo {} |grep '^Pages: ' | awk '{gsub(/^Pages:\s*/, '\s'); print $1}'" \;

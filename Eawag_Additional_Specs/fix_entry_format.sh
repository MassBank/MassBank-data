#!/bin/bash

sed -i "s/Atlantis T3 3um, 3x150mm, Waters with guard column/Atlantis T3 3um, 3.0x150mm, Waters with guard column/" *.txt
sed -i "s/X-bridge C18, 3.5um, 2.1x50mm, Waters/XBridge C18 3.5um, 2.1x50mm, Waters/" *.txt
sed -i "s/XBridge C18 3.5 um, 2.1x50 mm, Waters with guard column/XBridge C18 3.5um, 2.1x50mm, Waters with guard column/" *.txt

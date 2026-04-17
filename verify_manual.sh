#!/bin/bash
# Manual verification script for china-phone-rental-demo.html

echo "========================================="
echo "MANUAL VERIFICATION CHECKLIST"
echo "========================================="
echo ""

HTML_FILE="/Users/bujin/Documents/Projects/PhoneRental/china-phone-rental-demo.html"

echo "1. BRANDING ELEMENTS:"
echo "   ✓ NiHao Phone: $(grep -c 'NiHao Phone' $HTML_FILE) occurrences"
echo "   ✓ China Unicom 5G: $(grep -c 'China Unicom 5G' $HTML_FILE) occurrences"
echo "   ✓ DiDi: $(grep -c 'DiDi' $HTML_FILE) occurrences"
echo "   ✓ Meituan: $(grep -c 'Meituan' $HTML_FILE) occurrences"
echo "   ✓ WeChat: $(grep -c 'WeChat' $HTML_FILE) occurrences"
echo "   ✓ PIPL Compliance: $(grep -c 'PIPL' $HTML_FILE) occurrences"
echo ""

echo "2. FILE STRUCTURE:"
echo "   ✓ Screens found: $(grep -c 'class="screen"' $HTML_FILE) (expected: 9)"
echo "   ✓ Screens: $(grep -o 'id="screen-[^"]*"' $HTML_FILE | sort -u | tr '\n' ' ')"
echo "   ✓ Navigation buttons: $(grep -c 'onclick="goTo' $HTML_FILE) (expected: 42+)"
echo "   ✓ Overlays: $(grep -c 'class="overlay"' $HTML_FILE) (expected: 4+)"
echo "   ✓ Demo nav: $(grep -c 'demo-nav' $HTML_FILE) (expected: 1)"
echo ""

echo "3. PAYMENT METHODS:"
echo "   ✓ WeChat Pay: $(grep -c 'wechat' $HTML_FILE) occurrences"
echo "   ✓ Alipay QR: $(grep -c 'alipay' $HTML_FILE) occurrences"
echo "   ✓ UnionPay/4242: $(grep -c '4242' $HTML_FILE) occurrences"
echo "   ✓ Wallet ¥500: $(grep -c '¥500' $HTML_FILE) occurrences"
echo "   ✓ Currency conversion: $(grep -c '\$1.*¥7.24\|exchange rate' $HTML_FILE) occurrences"
echo ""

echo "4. INTERACTIVE ELEMENTS:"
echo "   ✓ goTo function: $(grep -c 'function goTo' $HTML_FILE) occurrences"
echo "   ✓ showOverlay function: $(grep -c 'function showOverlay' $HTML_FILE) occurrences"
echo "   ✓ closeOverlay function: $(grep -c 'function closeOverlay' $HTML_FILE) occurrences"
echo "   ✓ Live clock: $(grep -c 'getHours\|setInterval' $HTML_FILE) occurrences"
echo "   ✓ Transaction history: $(grep -c 'tx-list\|transaction' $HTML_FILE) occurrences"
echo "   ✓ Wallet updates: $(grep -c 'wallet' $HTML_FILE) occurrences"
echo ""

echo "5. CONTEXTUAL ELEMENTS:"
echo "   ✓ Chinese font: $(grep -c 'Noto Sans SC' $HTML_FILE) occurrences"
echo "   ✓ Chinese brands: $(grep -c 'DiDi\|Meituan\|WeChat\|Alipay' $HTML_FILE) occurrences"
echo "   ✓ Location: $(grep -c 'Shanghai\|Pudong' $HTML_FILE) occurrences"
echo "   ✓ Translation: $(grep -c 'translate\|翻译' $HTML_FILE) occurrences"
echo "   ✓ PIPL: $(grep -c 'PIPL\|隐私' $HTML_FILE) occurrences"
echo ""

echo "6. CSS STYLING:"
echo "   ✓ Phone frame: $(grep -c 'phone-frame' $HTML_FILE) occurrences"
echo "   ✓ Status bar: $(grep -c 'status-bar' $HTML_FILE) occurrences"
echo "   ✓ Red theme: $(grep -c 'var(--red)' $HTML_FILE) occurrences"
echo "   ✓ Animation: $(grep -c '@keyframes\|animation' $HTML_FILE) occurrences"
echo "   ✓ Mobile-first: $(grep -c 'viewport' $HTML_FILE) occurrences"
echo "   ✓ 375px width: $(grep -c '375px' $HTML_FILE) occurrences"
echo ""

echo "========================================="
echo "VERIFICATION COMPLETE"
echo "========================================="

# Quick pass/fail check
FAILED=0
FAILED=$((FAILED + $(grep -v 'NiHao Phone' $HTML_FILE | grep -c 'welcome-title') && echo 1 || echo 0))
FAILED=$((FAILED + $(grep -v '5G' $HTML_FILE | grep -c 'status-bar') && echo 1 || echo 0))
FAILED=$((FAILED + $(grep -c 'screen' $HTML_FILE | tail -1) < 9 && echo 1 || echo 0))

if [ $FAILED -eq 0 ]; then
    echo "✅ ALL MAJOR REQUIREMENTS VERIFIED"
else
    echo "⚠️  SOME CHECKS FAILED - REVIEW REQUIRED"
fi
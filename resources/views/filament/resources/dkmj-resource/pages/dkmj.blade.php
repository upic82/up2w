<x-filament-panels::page>

<head>
    <title>Purchase From PT. Supplier Maju Jaya</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f8fafc; }
        .invoice-container { background-color: white; box-shadow: 0 1px 3px rgba(0,0,0,0.1); padding: 24px; max-width: 800px; margin: 20px auto; }
        .header { border-bottom: 1px solid #e5e7eb; padding-bottom: 16px; }
        .billing-info { margin-top: 24px; }
        .invoice-table { width: 100%; margin-top: 24px; border-collapse: collapse; border: 1px solid #e2e8f0; }
        .invoice-table th, .invoice-table td { border: 1px solid #e2e8f0; padding: 8px; }
        .text-left { text-align: left; }
        .text-right { text-align: right; }
        .text-bold { font-weight: bold; }
        .text-gray { color: #4a5568; }
        .text-light-gray { color: #718096; }
        .bg-gray-50 { background-color: #f7fafc; }
        .footer { margin-top: 24px; text-align: center; color: #a0aec0; }
    </style>
</head>
<body>
<div class="invoice-container">
    <!-- Header -->
    <table class="header" style="width: 100%;">
        <tr>
            <td>
                <h1 style="font-size: 24px; font-weight: bold; color: #4a5568;">Invoice</h1>
                <p style="color: #a0aec0;">Invoice #INV-2023-001</p>
                <p style="color: #a0aec0;">Date: 15 November 2023</p>
            </td>
            <td style="text-align: right;">
                <img src="https://via.placeholder.com/150x50?text=Company+Logo" alt="Company Logo" style="height: 50px;">
            </td>
        </tr>
    </table>

    <!-- Billing Information -->
    <table class="billing-info" style="width: 100%;">
        <tr>
            <td>
                <h2 class="text-bold text-gray">Billed From</h2>
                <p class="text-light-gray">PT. Supplier Maju Jaya</p>
                <p class="text-light-gray">Jl. Industri Raya No. 123, Jakarta</p>
                <p class="text-light-gray">Email: sales@supplier.com</p>
            </td>
            <td style="text-align: right;">
                <h2 class="text-bold text-gray">Company</h2>
                <p class="text-light-gray">PT. Perusahaan Kita</p>
                <p class="text-light-gray">Jl. Sudirman Kav. 1, Jakarta</p>
                <p class="text-light-gray">10220</p>
                <p class="text-light-gray">Email: finance@perusahaan.com</p>
            </td>
        </tr>
    </table>

    <!-- Invoice Items -->
    <table class="invoice-table">
        <thead>
            <tr class="bg-gray-50">
                <th class="text-left text-gray">Description</th>
                <th class="text-right text-gray">Quantity</th>
                <th class="text-right text-gray">Unit Price</th>
                <th class="text-right text-gray">Total</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-left text-light-gray">Produk A - Kualitas Premium</td>
                <td class="text-right text-light-gray">10</td>
                <td class="text-right text-light-gray">$100.00</td>
                <td class="text-right text-light-gray">$1,000.00</td>
            </tr>
            <tr>
                <td class="text-left text-light-gray">Produk B - Standar</td>
                <td class="text-right text-light-gray">5</td>
                <td class="text-right text-light-gray">$50.00</td>
                <td class="text-right text-light-gray">$250.00</td>
            </tr>
            <tr>
                <td class="text-left text-light-gray">Produk C - Aksesoris</td>
                <td class="text-right text-light-gray">20</td>
                <td class="text-right text-light-gray">$10.00</td>
                <td class="text-right text-light-gray">$200.00</td>
            </tr>
        </tbody>
        <tfoot>
            <tr class="bg-gray-50">
                <td colspan="3" class="text-right text-bold text-gray">Subtotal</td>
                <td class="text-right text-gray">$1,450.00</td>
            </tr>
            <tr>
                <td colspan="3" class="text-right text-bold text-gray">Discount</td>
                <td class="text-right text-gray">$50.00</td>
            </tr>
            <tr>
                <td colspan="3" class="text-right text-bold text-gray">Total</td>
                <td class="text-right text-gray">$1,400.00</td>
            </tr>
        </tfoot>
    </table>

    <!-- Footer -->
    <div class="footer">
        <p>Thank you for your business!</p>
        <p>If you have any questions about this invoice, please contact us at finance@perusahaan.com.</p>
    </div>
</div>

</x-filament-panels::page>

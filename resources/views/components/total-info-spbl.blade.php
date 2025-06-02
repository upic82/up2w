<div class="p-4 bg-gray-100 rounded-md text-sm">
    <div><strong>Total:</strong> Rp {{ number_format($jumlah(), 0, ',', '.') }}</div>
    <div><strong>PPN:</strong> Rp {{ number_format($ppn(), 0, ',', '.') }}</div>
    <div><strong>Grand Total:</strong> <span class="font-bold text-green-700">Rp {{ number_format($grand_total(), 0, ',', '.') }}</span></div>
</div>
